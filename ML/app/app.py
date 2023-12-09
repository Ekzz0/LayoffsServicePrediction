import json

from fastapi import FastAPI, Body
from fastapi.responses import JSONResponse
from utils.data_structures import Score
from utils.feature_constructor import feature_constructor
from utils.loaded_model import MLModel
from utils.ml_api import load_model, load_feature_constructor
from utils.json_scripts import convert_dataframe_to_json, convert_json_to_dataframe
from typing import Any

model: MLModel
feature_construct: feature_constructor
app = FastAPI()


# Загрузка модели при старте приложение
@app.on_event("startup")
def startup_event(model_path: str = './models/RandomForest.pkl'):
    global model, feature_construct
    model = load_model(model_path)
    feature_construct = load_feature_constructor()


# create a route
@app.get("/")
def index() -> dict[str, str]:
    return {"text": "Probability predict"}


# GET запрос для предикта
@app.post("/predict")
def predict_prob(request: Any = Body(None)) -> JSONResponse:
    X = convert_json_to_dataframe(request)
    # Проверка на то, имеет ли полученный датасет все нужные столбцы для обработки
    if model.check_df_columns(X):
        # Конструирование признаков
        X_test = feature_construct(X)
        # Предикт
        pred = model.predict(X_test)
        response = convert_dataframe_to_json(pred)
        return response  # Если нужна строка с json форматом, то напиши: return json.dumps(response)
    else:
        return {'text': 'Недостаточно признаков в датасете'}


# GET запрос для конструирования признаков
@app.get("/fit")
def model_fit(X, y) -> Score:
    X = convert_json_to_dataframe(X)
    y = convert_json_to_dataframe(y)
    score = model.fit(X, y)
    return score


# GET запрос для сохранения обученной модели
@app.get("/save_model")
def model_save(path: str):
    model.save_model(path)
