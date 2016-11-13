# consult: https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#/add-or-copy
# Forked: https://hub.docker.com/r/amancevice/pandas
FROM alpine:3.4
MAINTAINER phirov@163.com

RUN apk add --no-cache python3-dev g++ && \
    ln -s /usr/include/locale.h /usr/include/xlocale.h
