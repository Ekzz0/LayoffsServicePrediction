import json
from typing import List
import pandas as pd
from .data_structures import UsersProbability


def convert_dataframe_to_json(df: pd.DataFrame | pd.Series) -> List[UsersProbability]:
    return df.to_dict(orient='records')
    # return df.sort_index().to_json(orient='records')


def convert_json_to_dataframe(json_file):
    df = pd.DataFrame([p_data.dict() for p_data in json_file])
    df.index = df['id']
    df = df.drop(columns='id')
    return df.dropna().sort_index()
