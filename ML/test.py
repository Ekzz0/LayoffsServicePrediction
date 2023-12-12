import pandas as pd

from APP.converters import convert_json_to_dataframe, convert_dataframe_to_json
from ML.APP.ml_service import load_model, load_feature_constructor
from ML.APP.processing import create_feature_importance_columns

model = load_model('./models/XGBoost.pkl')
feature_construct = load_feature_constructor()



