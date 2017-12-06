#!/usr/bin/python
import os
import time
import requests
import redis

DIR = os.path.dirname(os.path.realpath(__file__))

try:
    with open(DIR+'/ticker_id') as f:
        TICKER_ID = f.readline().rstrip()
except:
    print('Error reading ticker id')
    TICKER_ID = 'TEST'


url = "http://tools.stevesaylor.io/bus-ticker/message/" + TICKER_ID

_redis = redis.StrictRedis(host='localhost', port=6379, db=0)

timeout = time.time() + (60 * 40)

while time.time() < timeout:
    try:
        r = requests.get(url)
        response = r.json()
        message = response['message']
        sleep_time = 20
    except:
        message = 'Something went wrong - Let us know @pgh_bus_ticker'
        sleep_time = 5
        
    _redis.set('ticker_message_continuous', message)
    _redis.expire('ticker_message_continuous', 30)
    time.sleep(sleep_time)
    
