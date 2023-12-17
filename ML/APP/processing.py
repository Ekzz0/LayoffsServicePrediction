import pandas as pd
from sklearn.preprocessing import MinMaxScaler


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


def create_feature_importance_columns(ID, X_test, model):
    features = model.get_feature_importance(X_test, ID)[::-1]
    yield features

