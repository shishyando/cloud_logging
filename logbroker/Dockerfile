FROM python:3.8-slim

WORKDIR /logbroker
COPY . .

RUN pip install -r requirements.txt

WORKDIR /logbroker/app
CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "8000"]
