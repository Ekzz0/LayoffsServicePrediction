import pandas as pd

from APP.converters import convert_json_to_dataframe, convert_dataframe_to_json
from ML.APP.ml_service import load_model, load_feature_constructor
from ML.APP.processing import create_feature_importance_columns

model = load_model('./models/XGBoost.pkl')
feature_construct = load_feature_constructor()


df = pd.DataFrame([3, 2, 1, 4, 6, 5], columns=['val'])
print(df.sort_values(by=['val'])[::-1])
print(df.loc[[]])

