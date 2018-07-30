#!/bin/bash

# This script checks to see if the led driver and the message collector are working.
# If not, it will attemp to rerun them.

# CD to directory containing this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
pwd

# Run led driver if necessary
if ! pgrep -f "run_led_ticker.py" > /dev/null
then
    echo 'Starting Ticker'
    python $DIR/led-matrix-ticker/run_led_ticker.py -r -s 7 -w 8 &
else
    echo 'Ticker already running'
fi

# Run ticker client if necessary
if ! pgrep -f "get_ticker_msg.py" > /dev/null
then
    echo 'Starting message client'
    python $DIR/get_ticker_msg.py &
else
    echo 'Message client already running'
fi
