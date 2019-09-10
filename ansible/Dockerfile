FROM python:3-alpine

RUN apk add --no-cache --virtual build-dependencies gcc g++ libffi-dev openssl-dev && \
    pip3 install --no-cache-dir ansible ansible-lint && \
    apk del build-dependencies && apk add curl
