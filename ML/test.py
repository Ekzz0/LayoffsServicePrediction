import pandas as pd
import utils as ut
from utils.json_scripts import convert_dataframe_to_json, convert_json_to_dataframe

if __name__ == '__main__':
    j = [{'id': '20806', 'age': '34', 'job': 'entrepreneur', 'marital': 'married', 'education': 'professional.course',
          'default': 'no', 'housing': 'yes', 'loan': 'no',
          'contact': '0', 'month': 'aug', 'day_of_week': 'wed', 'duration': '73', 'campaign': '3', 'pdays': '999',
          'previous': '0', 'poutcome': 'nonexistent', 'emp.var.rate': '1.4', 'cons.price.idx': '93.444',
          'cons.conf.idx': '-36.1', 'euribor3m': '4.965', 'nr.employed': '5228.1'},
         {'id': '32487', 'age': '28', 'job': 'admin.',
          'marital': 'married', 'education': 'high.school', 'default': 'no', 'housing': 'no', 'loan': 'no',
          'contact': '0', 'month': 'may', 'day_of_week': 'fri', 'duration': '129', 'campaign': '2', 'pdays': '999',
          'previous': '0', 'poutcome': 'nonexistent', 'emp.var.rate': '-1.8', 'cons.price.idx': '92.893',
          'cons.conf.idx': '-46.2', 'euribor3m': '1.313', 'nr.employed': '5099.1'},
         {'id': '6605', 'age': '50', 'job': 'services', 'marital': 'married', 'education': 'basic.4y',
          'default': 'unknown', 'housing': 'yes', 'loan': 'no', 'contact': '1', 'month': 'may', 'day_of_week': 'wed',
          'duration': '507', 'campaign': '1', 'pdays': '999', 'previous': '0', 'poutcome': 'nonexistent',
          'emp.var.rate': '1.1', 'cons.price.idx': '93.994', 'cons.conf.idx': '-36.4', 'euribor3m': '4.857',
          'nr.employed': '5191.0'},
         {'id': '27542', 'age': '43', 'job': 'technician', 'marital': 'married', 'education': 'professional.course',
          'default': 'no', 'housing': 'no', 'loan': 'no', 'contact': '0', 'month': 'nov', 'day_of_week': 'fri',
          'duration': '14', 'campaign': '9', 'pdays': '999', 'previous': '0', 'poutcome': 'nonexistent',
          'emp.var.rate': '-0.1', 'cons.price.idx': '93.2', 'cons.conf.idx': '-42.0', 'euribor3m': '4.021',
          'nr.employed': '5195.8'},
         {'id': '37202', 'age': '35', 'job': 'admin.', 'marital': 'single', 'education': 'university.degree',
          'default': 'no', 'housing': 'no',
          'loan': 'no', 'contact': '0', 'month': 'aug', 'day_of_week': 'thu', 'duration':
              '250', 'campaign': '1', 'pdays': '999', 'previous': '1', 'poutcome': 'failure',
          'emp.var.rate': '-2.9', 'cons.price.idx': '92.201', 'cons.conf.idx': '-31.4', 'euribor3m': '0.883',
          'nr.employed': '5076.2'}, {'id': '323', 'age': '40', 'job':
            'services', 'marital': 'married', 'education': 'basic.6y', 'default': 'unknown'
             , 'housing': 'no', 'loan': 'no', 'contact': '1', 'month': 'may', 'day_of_week':
                                         'mon', 'duration': '199', 'campaign': '3', 'pdays': '999', 'previous': '0',
                                     'poutcome': 'nonexistent', 'emp.var.rate': '1.1', 'cons.price.idx': '93.994',
                                     'cons.conf.idx': '-36.4', 'euribor3m': '4.857', 'nr.employed': '5191.0'},
         {'id': '6431', 'age': '37', 'job': 'blue-collar', 'marital': 'single', 'education': 'high.school',
          'default': 'no', 'housing': 'no', 'loan': 'no', 'contact': '1', 'month':
              'may', 'day_of_week': 'wed', 'duration': '332', 'campaign': '1', 'pdays': '999',
          'previous': '0', 'poutcome': 'nonexistent', 'emp.var.rate': '1.1', 'cons.price.idx': '93.994',
          'cons.conf.idx': '-36.4', 'euribor3m': '4.857', 'nr.employed': '5191.0'},
         {'id': '5383', 'age': '42', 'job': 'self-employed', 'marital': 'married', 'education': 'university.degree',
          'default': 'no', 'housing': 'no', 'loan':
              'no', 'contact': '1', 'month': 'may', 'day_of_week': 'fri', 'duration': '493', 'campaign': '2',
          'pdays': '999', 'previous': '0', 'poutcome': 'nonexistent', 'emp.var.rate': '1.1', 'cons.price.idx': '93.994',
          'cons.conf.idx': '-36.4', 'euribor3m': '4.857', 'nr.employed': '5191.0'},
         {'id': '40964', 'age': '51', 'job': 'admin.', 'marital': 'married', 'education': 'high.school',
          'default': 'no', 'housing': 'no', 'loan': 'yes', 'contact': '0', 'month': 'oct', 'day_of_week': 'thu',
          'duration': '181', 'campaign': '2', 'pdays': '999', 'previous': '1', 'poutcome':
              'failure', 'emp.var.rate': '-1.1', 'cons.price.idx': '94.601', 'cons.conf.idx':
              '-49.5', 'euribor3m': '0.987', 'nr.employed': '4963.6'}, {'id': '33399', 'age':
            '32', 'job': 'blue-collar', 'marital': 'married', 'education': 'basic.9y', 'default': 'no',
                                                                        'housing': 'yes', 'loan': 'no', 'contact': '0',
                                                                        'month': 'may', 'day_of_week': 'tue',
                                                                        'duration': '293', 'campaign': '2',
                                                                        'pdays': '999', 'previous': '0',
                                                                        'poutcome': 'nonexistent',
                                                                        'emp.var.rate': '-1.8',
                                                                        'cons.price.idx': '92.893',
                                                                        'cons.conf.idx': '-46.2', 'euribor3m': '1.291',
                                                                        'nr.employed': '5099.1'}, {'id': ''}]


    # path = "./data/test.csv"
    # df = pd.read_csv(path, index_col=0)
    # X, y = ut.split_to_x_y(df, 'y')
    #
    # Генерация признаков
    print(j)
    # 1) Нужно конвертировать json в pd.DataFrame
    X = convert_json_to_dataframe(j)
    # 2) Импортируем конструктор признаков
    feature_construct = ut.load_feature_constructor()
    # 3) Получаем обработанный pd.DataFrame
    X_test = feature_construct(X)
    # 4) Загружаем модель
    path = "./models/RandomForest.pkl"
    model = ut.load_model(path)
    # 5) Получаем предикт
    clf_report = model.predict(X_test)
    # 6) Конвертируем в json и отдаем обратно
    response = convert_dataframe_to_json(clf_report)
    print(response)

    # # Получим топ фич, которые повлияли на ответ
    # ID = 37202
    # print(model.get_feature_importance(X_test, ID))
    #
    # # Обучение модели на каких-то новых данных:
    # path = "./data/train.csv"
    # train_data = pd.read_csv(path, index_col=0)
    # X, y = ut.split_to_x_y(train_data, 'y')
    # # Отсюда имитируем ситуацию: Получили json файл
    # X = convert_dataframe_to_json(X)
    # y = convert_dataframe_to_json(y)
    #
    # # 1) Нужно конвертировать json в pd.DataFrame
    # X = convert_json_to_dataframe(X)
    # y = convert_json_to_dataframe(y)
    # # 2) Обучаем модель
    # score = model.fit(X, y)
    # print(score)
