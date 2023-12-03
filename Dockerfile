FROM python:3.10.12-slim-buster

RUN apt update -y && apt install awscli -y
WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt
RUN pip install --upgrade accelerate
RUN pip uninstall -y transformers accelerate
RUN pip install transformers
RUN pip install accelerate==0.20.3

CMD ["python3", "app.py"]