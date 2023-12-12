import pandas as pd
import utils as ut
from utils.json_scripts import convert_dataframe_to_json, convert_json_to_dataframe
import joblib

if __name__ == '__main__':
    from pydantic import BaseModel, Field


    class MyData(BaseModel):
        id: str = Field(..., title="ID")


    # Пример использования:
    json_data = [{'': '0', 'id': '2801'}, {'': ''}]

    for item in json_data:
        try:
            validated_data = MyData(**item)
            print(validated_data)
        except Exception as e:
            print(f"Validation failed for item {item}: {e}")

