from typing import List
import pandas as pd
from .schemas import UsersProbability


def convert_dataframe_to_json(df: pd.DataFrame | pd.Series) -> List[UsersProbability]:
    return df.to_dict(orient='records')
    # return df.sort_index().to_json(orient='records')


def convert_json_to_dataframe(json_file):
    try:
        df = pd.DataFrame([p_data.dict() for p_data in json_file])
    except:
        df = pd.DataFrame(json_file)
    df.index = df['id']
    df = df.drop(columns='id')
    return df.dropna()
