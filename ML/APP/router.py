from .schemas import Score, PersonData, ResponsePredict
from .ml_service import load_model, load_feature_constructor
from .converters import convert_dataframe_to_json, convert_json_to_dataframe
from .processing import create_feature_importance_columns
from .feature_constructor import feature_constructor
from .loaded_model import MLModel

from http import HTTPStatus
from typing import Any, List
from fastapi import APIRouter
import os

router = APIRouter(
    tags=['ML API']
)

model: MLModel
feature_construct: feature_constructor


# Загрузка модели при старте приложение
@router.on_event("startup")
def startup_event(model_path: str = os.path.abspath('models/XGBoost.pkl')):
    global model, feature_construct
    model = load_model(model_path)
    feature_construct = load_feature_constructor()


# GET запрос для предикта Any = Body(None)
@router.post("/predict", response_model=ResponsePredict)
def predict_prob(request: List[PersonData]):
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


# GET запрос для конструирования признаков
@router.post("/fit")
def model_fit(request: List[PersonData]):
    pass
    # X = convert_json_to_dataframe(X)
    # y = convert_json_to_dataframe(y)
    # score = model.fit(X, y)
    # return score


# GET запрос для сохранения обученной модели
@router.get("/save_model")
def model_save(path: str):
    model.save_model(path)
