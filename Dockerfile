FROM fedora:latest
MAINTAINER xi4okv

RUN dnf -y install python

RUN pip install celery redis IPy pymongo requests

ENV THREAD 50

tail -f /dev/null


