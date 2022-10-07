FROM python:3.10

EXPOSE 80/tcp

WORKDIR /application

COPY ./requirements.txt /application/requirements.txt

RUN pip install --no-cache-dir --upgrade  -r /application/requirements.txt

COPY ./app /application/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
