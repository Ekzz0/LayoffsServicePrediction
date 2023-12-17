# Этап сборки зависимостей
FROM python:3.11 AS builder

# Копируем файл зависимостей и устанавливаем их
COPY requirements.txt .

# Установка зависимостей
RUN python -m venv /venv
RUN /venv/bin/pip install --no-cache-dir -r requirements.txt

# Этап финальной сборки приложения
FROM python:3.11

COPY /APP /APP
COPY /models /models
COPY app.py .

# Копируем установленную виртуальную среду с зависимостями из предыдущего этапа
COPY --from=builder /venv /venv

# Указываем путь к интерпретатору Python из виртуальной среды
ENV PATH="/venv/bin:$PATH"
ENV PYTHONUNBUFFERED=1

# Запускаем uvicorn сервер
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8889"]