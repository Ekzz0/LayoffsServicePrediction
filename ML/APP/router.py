from .data_processing import split_to_x_y
from .schemas import PersonData, ResponsePredict, PersonDataTrain, ResponseFit, BaseResponse
from .ml_service import load_model, load_feature_constructor
from .converters import convert_dataframe_to_json, convert_json_to_dataframe
from .processing import create_feature_importance_columns
from .feature_constructor import feature_constructor
from .loaded_model import MLModel

from http import HTTPStatus
from typing import List
from fastapi import APIRouter
import os

router = APIRouter(
    tags=['ML API']
)

model: MLModel
new_model: MLModel
feature_construct: feature_constructor


# Загрузка модели при старте приложение
@router.on_event("startup")
def startup_event(name: str = 'XGBoost'):
    global model, new_model, feature_construct
    model = load_model(os.path.join('./models', name + '.pkl'))
    new_model = load_model(os.path.join('./models', name + '.pkl'))
    feature_construct = load_feature_constructor()


# Запрос для предикта Any = Body(None)
@router.post("/predict", response_model=ResponsePredict)
def predict_prob(request: List[PersonData]):
    global model, feature_construct
    # Конвертируем List[PersonData] в pd.DataFrame
    X = convert_json_to_dataframe(request)

    # Конструирование признаков
    X_test = feature_construct(X.drop(columns=model.files['cols_to_drop']))

    # Получение предикта
    pred = model.predict(X_test)

    # Восстановим значение удаленных столбцов
    for col in model.files['cols_to_drop']:
        pred[col] = X[col].values

    # Конвертируем pd.DataFrame в List[UsersProbability]
    response = convert_dataframe_to_json(pred)

    # Добавим названия ТОП 7-х признаков, которые повлияли на прогноз для каждого пользователя:
    for user_dict in response:
        user_dict['TopFeatures'] = next(create_feature_importance_columns(user_dict['id'], X_test, model))

    return {'status': HTTPStatus.OK, 'data': response}


# Запрос для конструирования признаков
@router.post("/fit", response_model=ResponseFit)
def model_fit(request: List[PersonDataTrain]):
    global feature_construct, new_model
    # Конвертируем List[PersonDataTrain] в pd.DataFrame
    df = convert_json_to_dataframe(request)

    # Конструирование признаков
    df = feature_construct(df.drop(columns=model.files['cols_to_drop']))

    # Разделим на X, y
    X, y = split_to_x_y(df, 'Resigned')

    # Обучение модели
    score = new_model.fit(X, y)

    return {'status': HTTPStatus.OK, 'data': score}


# Запрос для сохранения обученной модели
@router.post("/save_model", response_model=BaseResponse)
def save(name: str = 'XGBoost'):
    global new_model
    new_model.save_model(os.path.join('./models', name + '.pkl'))
    return {'status': HTTPStatus.OK, 'data': ''}


# Запрос для загрузки обученной модели
@router.post("/load_model", response_model=BaseResponse)
def load(name: str = 'XGBoost'):
    global model
    try:
        model = load_model(os.path.join('./models', name + '.pkl'))
    except FileNotFoundError:
        return {'status': HTTPStatus.BAD_REQUEST, 'data': ''}
    else:
        return {'status': HTTPStatus.OK, 'data': ''}
