from .feature_constructor import feature_constructor
from .loaded_model import MLModel


def load_model(path: str) -> MLModel:
    return MLModel(path)


def load_feature_constructor() -> feature_constructor:
    return feature_constructor()
