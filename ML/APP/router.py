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
feature_construct: feature_constructor


# Загрузка модели при старте приложение
@router.on_event("startup")
def startup_event(path: str = os.path.abspath('models/XGBoost.pkl')):
    global model, feature_construct
    model = load_model(path)
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
    global model, feature_construct
    # Конвертируем List[PersonDataTrain] в pd.DataFrame
    df = convert_json_to_dataframe(request)

    # Конструирование признаков
    df = feature_construct(df.drop(columns=model.files['cols_to_drop']))

    # Разделим на X, y
    X, y = split_to_x_y(df, 'Resigned')

    # Обучение модели
    score = model.fit(X, y)

    return {'status': HTTPStatus.OK, 'data': score}


# Запрос для сохранения обученной модели
@router.post("/save_model", response_model=BaseResponse)
def save_model(path: str):
    global model, feature_construct
    model.save_model(path)
    return {'status': HTTPStatus.OK, 'data': ''}


# Запрос для загрузки обученной модели
@router.post("/load_model", response_model=BaseResponse)
def load_model(path: str):
    global model, feature_construct
    model = load_model(path)
    return {'status': HTTPStatus.OK, 'data': ''}
