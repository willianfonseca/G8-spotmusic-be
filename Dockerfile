FROM ubuntu:20.04

ARG CLOUD_SQL_USERNAME=playuser
ARG CLOUD_SQL_PASSWORD=fiap
ARG CLOUD_SQL_DATABASE_NAME=playlist
ARG DB_LOCAL_HOST=10.40.48.3
ARG CLOUD_SQL_CONNECTION_NAME=hack-aso-grupo-08:us-central1:mysql

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]