# consult: https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#/add-or-copy
# Fork from:
# https://hub.docker.com/r/amancevice/pandas
FROM alpine
MAINTAINER phirov@163.com

ENV PANDAS_VERSION 0.18.1
ENV GUNICORN_VERSION 19.6.0

RUN apk add --no-cache python-dev py-pip && \
    apk add --no-cache --virtual .build-deps g++ && \
    ln -s /usr/include/locale.h /usr/include/xlocale.h && \
    pip install -y flask-restful jmespath pymongo && \
    pip install --no-cache-dir pandas>=$PANDAS_VERSION && \
    pip install --no-cache-dir gunicorn>=$GUNICORN_VERSION && \
    apk del .build-deps
