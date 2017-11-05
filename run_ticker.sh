#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR

echo 'Starting Ticker'
python ./led-matrix-ticker/demo.py -r &


echo 'Starting message client'
python ./get_ticker_msg.py &

