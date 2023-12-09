import pandas as pd
import numpy as np
from sklearn.utils import shuffle
from sklearn.preprocessing import MinMaxScaler


def balance_the_dataset(data: pd.DataFrame, y_name: str) -> pd.DataFrame:
    R = np.random.RandomState(42)

    # Resampling датасета
    yes_index = np.array(data[data[f"{y_name}"] == 1].index)
    no_index = np.array(data[data[f"{y_name}"] == 0].index)
    new_no_index = R.choice(no_index, len(yes_index))

    # Сгенерируем датасет по индексам
    data = data.loc[list(np.array(new_no_index)) + list(np.array(yes_index))]

    # Перемешаем датасет
    data = shuffle(data, random_state=41)
    data.index = range(len(data))
    return data


def split_to_x_y(df: pd.DataFrame, y_name: str) -> tuple[pd.DataFrame, pd.Series]:
    X = df.iloc[:, df.columns != y_name]
    y = df.iloc[:, df.columns == y_name]

    return X, y


def get_feature_indexes(cols, features):
    indexes = []
    for feature in features:
        ind = list(cols).index(feature)
        indexes.append(ind)
    return indexes


def get_importance(df, feature_importance_, ID, feature_ind):
    try:
        values = df.loc[f'{ID}'].values[feature_ind]
    except:
        values = df.loc[ID].values[feature_ind]
    importance = feature_importance_[feature_ind]
    res = pd.DataFrame(values * importance, columns=['importance'])
    try:
        res.index = df.loc[ID].iloc[feature_ind].index
    except:
        res.index = df.loc[f'{ID}'].iloc[feature_ind].index
    scaler = MinMaxScaler()
    res['importance'] = scaler.fit_transform(res['importance'].values.reshape(-1, 1))

    return res.sort_values(by=['importance'])


