# consult: https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#/add-or-copy
# Fork from:
# https://hub.docker.com/r/amancevice/pandas
FROM continuumio/anaconda
MAINTAINER phirov@163.com

ENV BOKEH_APP demo.py

EXPOSE 5006
WORKDIR /bokeh

RUN conda install -y bokeh
    
ADD ./demo.py /bokeh/

CMD ["bokeh", "serve", "BOKEH_APP"]

