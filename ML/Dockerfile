# Используем базовый образ Python
FROM python:3.11

ENV PYTHONUNBUFFERED=1

# Копируем файл зависимостей и устанавливаем их
COPY requirements.txt .
COPY app/ .
COPY utils/ .
COPY models/ .

# Устанавливаем все зависимости
RUN pip install -r requirements.txt

# Запускаем uvicorn сервер
CMD ["uvicorn", "app.app:app", "--host", "0.0.0.0", "--port", "8889"]
