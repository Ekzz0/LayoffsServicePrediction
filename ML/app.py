import os
from http import HTTPStatus

from fastapi import FastAPI, Body
from APP.schemas import Score, PersonData, ResponsePredict
from APP.feature_constructor import feature_constructor
from APP.loaded_model import MLModel
from APP.ml_api import load_model, load_feature_constructor
from APP.converters import convert_dataframe_to_json, convert_json_to_dataframe
from APP.processing import create_feature_importance_columns
from typing import Any, List

model: MLModel
feature_construct: feature_constructor
app = FastAPI()


# Загрузка модели при старте приложение
@app.on_event("startup")
def startup_event(model_path: str = os.path.abspath('ML/models/XGBoost.pkl')):
    global model, feature_construct
    model = load_model(model_path)
    feature_construct = load_feature_constructor()


# create a route
@app.get("/")
def index() -> dict[str, str]:
    return {"text": "Probability predict"}


# GET запрос для предикта Any = Body(None)
@app.post("/predict", response_model=ResponsePredict)
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

    # Добавим названия ТОП 7-х признаков, которые повлияли на прогноз для каждого пользователя:
    pred = create_feature_importance_columns(pred, X_test, model)

    # Конвертируем pd.DataFrame в List[UsersProbability]
    response = convert_dataframe_to_json(pred)

    return {'status': HTTPStatus.OK, 'data': response}


# GET запрос для конструирования признаков
@app.get("/fit")
def model_fit(X: List[PersonData], y: Any = Body(None)) -> Score:
    X = convert_json_to_dataframe(X)
    y = convert_json_to_dataframe(y)
    score = model.fit(X, y)
    return score


# GET запрос для сохранения обученной модели
@app.get("/save_model")
def model_save(path: str):
    model.save_model(path)
