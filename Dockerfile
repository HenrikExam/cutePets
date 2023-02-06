FROM python:3.8-slim-buster

RUN apt-get update && \
    apt-get install -y \
        python3-dev \
        default-libmysqlclient-dev \
        build-essential  \
        git && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/HenrikExam/cutePets.git

COPY ./requirements.txt /requirements.txt

RUN pip3 install -r requirements.txt && rm /requirements.txt

WORKDIR /cutePets

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]