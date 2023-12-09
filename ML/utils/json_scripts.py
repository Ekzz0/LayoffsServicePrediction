import json

import pandas as pd


def convert_dataframe_to_json(df: pd.DataFrame | pd.Series) -> json:
    return df.sort_index().to_json(orient='records')


def convert_json_to_dataframe(json_file):
    df = pd.DataFrame(json_file)
    df.index = df['id']
    df = df.drop(columns='id')
    return df.dropna().sort_index()
