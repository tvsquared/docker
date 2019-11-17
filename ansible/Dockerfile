FROM python:3-alpine

ENV PACKER_VERSION=1.4.5

ADD https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip ./

RUN apk add --no-cache --virtual build-dependencies gcc g++ libffi-dev openssl-dev && \
    pip3 install --no-cache-dir ansible ansible-lint && \
    apk del build-dependencies && apk add curl openssh-client && \
    unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /bin && \
    rm packer_${PACKER_VERSION}_linux_amd64.zip
