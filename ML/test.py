from APP.converters import convert_json_to_dataframe, convert_dataframe_to_json
from ML.APP.ml_service import load_model, load_feature_constructor
from ML.APP.processing import create_feature_importance_columns

model = load_model('./models/XGBoost.pkl')
feature_construct = load_feature_constructor()

request = [{"id": 2801, "SentMessages": 51, "ReceivedMessages": 114, "MessagesOutsideWorkHours": 0, "SentFrequency": 9,
            "ReceivedFrequency": 41, "sent_received_ratio": 2.1923076923, "UniqueRecipients": 6, "hidden_copy": 3,
            "carbon_copy": 1, "text_length": 138, "BytesSentReceivedRatio": 0.994579635, "question_marks": 0,
            "response_time": 0, "MessagesReadLater": 6, "DaysBetweenReceivedAndRead": 0, "answered_messages": 22,
            "unanswered_messages": 1, "unreplied_messages": 6, "mention_colleagues": 0, "MoodType": 0,
            "StressKeywordsPresent": 0, "SalaryChangeMentioned": 0, "VacationMentioned": 1, "polite_message": 0,
            "Group": "Group1"},
           {"id": 2802, "SentMessages": 0, "ReceivedMessages": 30000, "MessagesOutsideWorkHours": 0, "SentFrequency": 9,
            "ReceivedFrequency": 5000, "sent_received_ratio": 2.1923076923, "UniqueRecipients": 60, "hidden_copy": 20,
            "carbon_copy": 100, "text_length": 138, "BytesSentReceivedRatio": 1.55544554, "question_marks": 33,
            "response_time": 0, "MessagesReadLater": 2000, "DaysBetweenReceivedAndRead": 120, "answered_messages": 0,
            "unanswered_messages": 5000, "unreplied_messages": 502, "mention_colleagues": 0, "MoodType": 0,
            "StressKeywordsPresent": 0, "SalaryChangeMentioned":900, "VacationMentioned": 1000, "polite_message": 0,
            "Group": "Group2"}]

# Конвертируем List[PersonData] в pd.DataFrame
X = convert_json_to_dataframe(request)

# Конструирование признаков
X_test = feature_construct(X.drop(columns=model.files['cols_to_drop']))

# Получение предикта
pred = model.predict(X_test)

# Восстановим значение удаленных столбцов
for col in model.files['cols_to_drop']:
    pred[col] = X[col].values

# Добавим названия ТОП 7-х признаков, которые повлияли на прогноз для каждого пользователя:
# features =

# print(features)
# Конвертируем pd.DataFrame в List[UsersProbability]
response = convert_dataframe_to_json(pred)

for user_dict in response:
    user_dict['TopFeatures'] = next(create_feature_importance_columns(user_dict['id'], X_test, model))
