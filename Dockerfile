# Используем базовый образ с Python 3
FROM python:3

# Копируем файлы проекта в рабочую директорию
COPY . /app/

# Устанавливаем рабочую директорию
WORKDIR /app

# Устанавливаем необходимые модули
RUN pip install -r requirements.txt

# Добавляем команду для установки django
RUN pip install django

# Открываем порт 8000 для веб-сервера
EXPOSE 8000

# Запускаем сервер django при запуске контейнера
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
