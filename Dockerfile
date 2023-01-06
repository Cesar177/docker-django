
FROM python:3.11-slim

# Instalar la dependencia para linux

RUN apt update && apt install -y \
  libpq-dev \
  gcc \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /app

WORKDIR /app

COPY requirements.txt /app

RUN pip install -r requirements.txt

COPY . /app

ENV PYTHONPATH = /app

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
