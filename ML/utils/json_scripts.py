import json

import pandas as pd


def convert_dataframe_to_json(df: pd.DataFrame | pd.Series) -> json:
    return df.sort_index().to_json(orient='records')


def convert_json_to_dataframe(json_file):
    try:
        df = pd.DataFrame(eval(json_file))
    except:
        df = pd.DataFrame(json_file)
    df.index = df['id']
    df = df.drop(columns='id')

    for col in df.columns:
        if col == '':
            df = df.drop(columns=col)

    return df.dropna().sort_index()
