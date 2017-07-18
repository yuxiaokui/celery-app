FROM fedora:latest
MAINTAINER xi4okv

RUN dnf -y install python

RUN pip install celery redis IPy pymongo requests

ENV THREAD 10

ENTRYPOINT  cd /app && celery -A tasks worker  --loglevel=info -c $THREAD
