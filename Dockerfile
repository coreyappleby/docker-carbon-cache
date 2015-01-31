FROM debian:jessie

ENV VERSION 0.9.x
ENV WHISPER_VERSION 0.9.13

RUN apt-get update -q &&  apt-get upgrade -y && apt-get install -y locales

ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8

RUN apt-get install -y python python-dev python-pip git-core
RUN pip install -U pip
RUN pip install git+https://github.com/graphite-project/carbon.git@${VERSION}#egg=carbon whisper==${WHISPER_VERSION}
WORKDIR /opt/graphite
RUN cp conf/carbon.conf.example conf/carbon.conf && \
    cp conf/storage-schemas.conf.example conf/storage-schemas.conf && \
    cp conf/storage-aggregation.conf.example conf/storage-aggregation.conf

EXPOSE 2003
EXPOSE 2004
VOLUME /opt/graphite/storage

CMD ./bin/carbon-cache.py --nodaemon start
