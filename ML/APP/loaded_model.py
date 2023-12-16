from sklearn.metrics import recall_score, f1_score, precision_score, classification_report
from sklearn.model_selection import train_test_split
from .processing import get_feature_indexes, get_importance
from .schemas import Score, ClassificationReport
import pandas as pd
import numpy as np
import traceback
import joblib
import os


class MLModel:
    # Загрузим все необходимые файлы в словарь, чтобы потом к ним обращаться по именам
    files = {}
    file_names = ['bin_f', 'count_f', 'num_f', 'cols_to_drop']
    for name in file_names:
        files[name] = joblib.load(os.path.join('APP/data/', name))

    def __init__(self, path: str):
        # Загрузка модель из файла
        self.model = joblib.load(path)
        self.path = path

    def predict(self, X: pd.DataFrame) -> pd.DataFrame:
        # Предикт
        pred = pd.DataFrame(self.model.predict_proba(X.values),
                            index=X.index,
                            columns=['probability_false', 'probability'])
        pred['id'] = pred.index.astype('int')
        return pred[['id', 'probability']]

    def fit(self, X: pd.DataFrame, y: pd.Series) -> ClassificationReport:
        # Разделение на train и test выборки
        X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
        X_train = X_train if type(X_train) == np.ndarray else X_train.values
        y_train = y_train if type(y_train) == np.ndarray else y_train.values.ravel()

        # Обучение модели
        self.model.fit(X_train, y_train)

        # Валидация модели
        predictions = self.model.predict(X_test.values)
        report = classification_report(y_true=y_test, y_pred=predictions, output_dict=True)

        report['first'] = report['0']
        report['second'] = report['1']
        report['macro_avg'] = report['macro avg']
        report['weighted_avg'] = report['weighted avg']

        report['weighted_avg']['f1'] = report['weighted_avg']['f1-score']
        report['macro_avg']['f1'] = report['macro_avg']['f1-score']
        report['first']['f1'] = report['first']['f1-score']
        report['second']['f1'] = report['second']['f1-score']

        del report['0'], report['1'], report['macro avg'], report['weighted avg']
        del report['second']['f1-score'], report['first']['f1-score']
        del report['macro_avg']['f1-score'], report['weighted_avg']['f1-score']

        return ClassificationReport(first=report['first'],
                                    second=report['second'],
                                    macro_avg=report['macro_avg'],
                                    weighted_avg=report['weighted_avg'],
                                    accuracy=report['accuracy'])

    def save_model(self, path: str):
        joblib.dump(self.model, path)

    def get_feature_importance(self, df: pd.DataFrame, ID: int) -> list[str]:
        try:
            fi = self.model.feature_importances_
        except Exception as e:
            print('Модель еще не обучена.')
        else:
            # Получим индексы для всех типов признаков
            bin_f_ind = get_feature_indexes(df.columns, self.files['bin_f'])
            count_f_ind = get_feature_indexes(df.columns, self.files['num_f'])
            num_f_ind = get_feature_indexes(df.columns, self.files['count_f'])
            try:
                # Получим влияние признаков для конкретного пользователя
                bin_f_imp = get_importance(df, fi, ID, bin_f_ind)
                count_f_imp = get_importance(df, fi, ID, count_f_ind)
                num_f_imp = get_importance(df, fi, ID, num_f_ind)
            except KeyError:
                print('Пользователь не найден в списке')
            except Exception as e:
                print(e)
                print(traceback.format_exc())
            else:
                features = pd.concat([bin_f_imp, count_f_imp, num_f_imp]).sort_values(by=['importance'])
                return list(features.tail(7).index)
