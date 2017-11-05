#!/usr/bin/python
import time
import requests
import redis

TICKER_ID  = 'TEST'

url = "http://tools.stevesaylor.io/bus-ticker/message/" + TICKER_ID

_redis = redis.StrictRedis(host='localhost', port=6379, db=0)

timeout = time.time() + (60 * 40)

while time.time() < timeout:
    r = requests.get(url)
    response = r.json()
    message = response['message']
    _redis.set('ticker_message_continuous', message)
    _redis.expire('ticker_message_continuous', 10)
    time.sleep(20)
    