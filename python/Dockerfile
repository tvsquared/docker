FROM python:3.5 AS base

RUN apt-get -yq update && apt-get -yq install libsnappy-dev && apt-get -yq clean

#COPY python/requirements.txt .
#RUN pip install -r requirements.txt