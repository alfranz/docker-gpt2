#FROM frolvlad/alpine-python3:latest
FROM tensorflow/tensorflow:1.12.0-py3

COPY . /nlp

WORKDIR /nlp

RUN pip3 install -r requirements.txt

RUN chmod +x /nlp/download_model.sh

RUN sh download_model.sh 117M


