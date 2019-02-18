FROM python:3.6.8-stretch 

COPY download_model.sh /nlp/download_model.sh 

COPY requirements.txt requirements.txt

RUN chmod +x /nlp/download_model.sh

RUN pip3 install -r requirements.txt

COPY src /nlp/src

WORKDIR /nlp

RUN sh ./download_model.sh 117M

ENTRYPOINT [ "python3", "src/interactive_conditional_samples.py", "--top_k 40" ]