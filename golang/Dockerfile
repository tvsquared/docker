FROM golang:1.17

RUN apt-get -qq update && \
    apt-get -qy install \
    libsndfile1-dev libavutil-dev libavcodec-dev libavformat-dev libavdevice-dev dpkg-dev \
    ffmpeg debhelper && \
    apt-get clean
