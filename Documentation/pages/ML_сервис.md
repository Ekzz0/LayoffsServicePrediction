# ML - сервис
## Описание
ML - сервис реализован в виде микросервиса на Python, который предоставляет API для использования машинного обучения основной части приложения.

API реализовано на фреймворке [FastAPI](https://fastapi-tutorial.readthedocs.io/en/latest/).

Используемые ML модели: [Random Forest Classifier](https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.RandomForestClassifier.html), [XGBoost Classifier](https://xgboost.readthedocs.io/en/stable/python/python_api.html)

Для получения прогноза в модель ожидает загрузку [[файла формата .csv]]

## Примеры кода
Все запросы находятся в маршрутизатору ``router.py``, который подключается к экземпляру [FastAPI](https://fastapi-tutorial.readthedocs.io/en/latest/).  приложения.
### API дает возможность осуществлять следующие запросы:
```python
@router.post("/predict", response_model=ResponsePredict)  
def predict_prob(request: List[PersonData]):  
    # Получение предикта
    # ...
  
    return {'status': HTTPStatus.OK, 'data': response}  
  
  
# Запрос для конструирования признаков  
@router.post("/fit", response_model=ResponseFit)  
def model_fit(request: List[PersonDataTrain]):  
    # Дообучение модели
    # ...
  
    return {'status': HTTPStatus.OK, 'data': score}  
  
  
# Запрос для сохранения обученной модели  
@router.post("/save_model", response_model=BaseResponse)  
def save(name: str = 'XGBoost'):  
    # Сохранение обученной модели
    # ...
    return {'status': HTTPStatus.OK, 'data': ''}  
  
  
# Запрос для загрузки обученной модели  
@router.post("/load_model", response_model=BaseResponse)  
def load(name: str = 'XGBoost'):  
    # Замена текущей модели на новую
    # ...
        return {'status': HTTPStatus.OK, 'data': ''}
```
При запуске сервера FastAPI на него загружается ML модель класса ``MLModel``. И конструктор признаков ``feature_constructor``.

Backend часть приложения может обращаться к данному API по адресу ``.../api/_request_name_``

### Класс ML модели выглядит следующим образом:
```python
class MLModel:  
    # Загрузка необходимых файлов
    # ...
  
    def __init__(self, path: str):  
        # Загрузка модели из файла    
		# ...
		
    def predict(self, X: pd.DataFrame) -> pd.DataFrame:  
        # Получение предикта
        # ...
  
    def fit(self, X: pd.DataFrame, y: pd.Series) -> ClassificationReport:  
        # Обучение модели
        # ...
  
    def save_model(self, path: str):  
        # Сохранение модели
        # ...
  
    def get_feature_importance(self, df: pd.DataFrame, ID: int) -> list[str]:  
        # Получение Топ признаков, которые повлияли на результат
        # ...
```
Данный класс реализует такие основные действия, как
- сохранение модели
- получение прогноза
- обучение модели
- получение топа признаков, которые могли повлиять на результат

Все последующие доработки, которые будут касаться ML - модели, необходимо реализовывать в данном классе и, при необходимости, добавлять их в ``router.py``

### Конструктор признаков имеет следующий интерфейс:
```python
def feature_constructor(calc_type='simple'):  
    def feature_construct(df: pd.DataFrame) -> pd.DataFrame:  
        # Обработка признаков. Приведение их в вид, нужный для ML модели
        # ...  
        return df.dropna()  
  
    def multi_feature_construct(df: pd.DataFrame, chunk_size: int = 1000) -> pd.DataFrame:  
        # Параллельная обработка признаков. chunk_size - размер "батча"
        # ...
        return data  
  
    return multi_feature_construct if calc_type == 'multi' else feature_construct
```
Как видно из интерфейса, конструктор признаков поддерживает два типа обработки данных: 
- Синхронный: является вариантом "по умолчанию"
- Параллельный: можно использовать для ускоренной обработки очень больших данных 

В ``feature_construct`` реализован весь процесс подготовки данных для получения прогноза от ML модели. 
Заново конструировать признаки необходимо для каждого входного [[файла формата .csv]]

### PyDantic схемы для валидации входных и выходных данных

ML - сервис общается с остальным частями программы файлами [json](https://ru.wikipedia.org/wiki/JSON) формата.

**Структура Pydantic схем:**
```python
class PersonData(BaseModel):  
    # Содержит все поля, которые должны присутствовать в .csv файле
    # ...
  
  
class PersonDataTrain(PersonData):  
    # Содержит все поля, которые должны присутствовать в .csv файле + целевую переменную
    # ...
  
  
class UsersProbability(BaseModel):  
	# Содержит id, веростность увольнения, группу сотрудника и топ признаков, которые повлияли на результат
	# ...
  
    
class ResponsePredict(BaseModel):  
	# Формат ответа на backend от ML - сервиса по predict запросу
    status: int  
    data: List[UsersProbability]  


class Score(BaseModel):  
    # Содержит основные метрики оценки обученной модели
	# ...
  
class ClassificationReport(BaseModel):  
    # Повторяет структуру classification_report из sklearn.
    # Каждому полю присваивается соответствующий класс Score.
    # ...
  
  
class ResponseFit(BaseModel):  
	# Формат ответа на backend от ML - сервиса по fit запросу
    status: int  
    data: ClassificationReport  

class BaseResponse(BaseModel): 
	# Формат ответа на backend от ML - сервиса по load и save запросу
    status: int  
    data: str
```
Данные классы используются для валидации входных данных. Если загруженный .csv файл не содержит необходимые поля, то возвращается ошибка [422 Unprocessable Entity](https://fastapi.tiangolo.com/tutorial/handling-errors/)

**Назад в [Документацию](../Документация.md)**
