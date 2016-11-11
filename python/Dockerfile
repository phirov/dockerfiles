# consult: https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#/add-or-copy
# Fork from:
# https://hub.docker.com/r/amancevice/pandas
FROM alpine
MAINTAINER phirov@163.com

RUN apk add --no-cache python-dev py-pip && \
    apk add --no-cache --virtual .build-deps g++ && \
    ln -s /usr/include/locale.h /usr/include/xlocale.h && \
    apk del .build-deps
