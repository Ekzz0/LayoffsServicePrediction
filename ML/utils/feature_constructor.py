from sklearn.preprocessing import LabelEncoder, OrdinalEncoder
import pandas as pd
from joblib import Parallel, delayed


def feature_constructor(calc_type='simple'):
    def feature_construct(df: pd.DataFrame) -> pd.DataFrame:
        pass
        return df

    def multi_feature_construct(df: pd.DataFrame, chunk_size: int = 1000) -> pd.DataFrame:
        dfs = [df[i:i + chunk_size] for i in range(0, len(df), chunk_size)]
        results = Parallel(n_jobs=5)(delayed(feature_construct)(X) for X in dfs)
        data = pd.concat(results)
        return data

    return multi_feature_construct if calc_type == 'multi' else feature_construct
