import pandas as pd
from joblib import Parallel, delayed


def numeric_transform(df, col):
    df[f"{col}"] = pd.to_numeric(df[f"{col}"])
    return df


def feature_constructor(calc_type='simple'):
    def feature_construct(df: pd.DataFrame) -> pd.DataFrame:
        df.index = df.index.astype('int')
        for col in df.columns:
            df = numeric_transform(df, col)
        return df.dropna()

    def multi_feature_construct(df: pd.DataFrame, chunk_size: int = 1000) -> pd.DataFrame:
        dfs = [df[i:i + chunk_size] for i in range(0, len(df), chunk_size)]
        results = Parallel(n_jobs=5)(delayed(feature_construct)(X) for X in dfs)
        data = pd.concat(results)
        return data

    return multi_feature_construct if calc_type == 'multi' else feature_construct
