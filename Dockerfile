FROM ubuntu:24.04

#MAINTANER Your Name youremail@domain.tld

RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev python3-venv

# We copy just the requirements.txt first to leverage Docker cache
WORKDIR /app

# Insert the requirements file so Docker knows to inject Flask
COPY ./requirements.txt /app/requirements.txt

RUN python3 -m venv venv
RUN venv/bin/pip install --no-cache-dir -r requirements.txt

COPY . /app

CMD ["venv/bin/python", "/app/hello.py"]
