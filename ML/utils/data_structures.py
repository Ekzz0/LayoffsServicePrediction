from dataclasses import dataclass
from pydantic import BaseModel


# Класс для response после fit
class Score(BaseModel):
    precision: float
    recall: float
    f1: float


@dataclass
class FeatureImportance:
    features: list[str]
    importance: list[float]


