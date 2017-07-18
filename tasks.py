from celery import Celery
BROKER_URL = 'redis://redis.t2.daoapp.io:61254/0'
BACKEND_URL = 'redis://redis.t2.daoapp.io:61254/1'

celery = Celery('tasks',
    broker=BROKER_URL,
    backend=BACKEND_URL)
    
import socket
import sys, os, time
import requests
import pymongo


client = pymongo.MongoClient('mongodb://mongodb.t2.daoapp.io:61257/')
db = client['sites']
posts = db['sites']


@celery.task
def scan(url):
    headers = requests.head(url, timeout=3).headers
    headers["url"] = url
    posts.insert_one(headers)
    return headers
