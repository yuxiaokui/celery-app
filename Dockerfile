FROM fedora:latest
MAINTAINER xi4okv

RUN dnf -y install python

RUN pip install celery redis IPy pymongo

ENTRYPOINT  cd /app && celery -A tasks worker  --loglevel=info -c 50
