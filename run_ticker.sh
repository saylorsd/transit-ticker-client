#!/bin/bash

# This script checks to see if the led driver and the message collector are working.
# If not, it will attemp to rerun them.

# CD to directory containg this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR


# Run led driver if necessary
if pgrep -x "led-matrix-ticker/demo.py" > /dev/null
then
    echo 'Starting Ticker'
    ./led-matrix-ticker/demo.py -r &
fi

# Run ticker client if necessary
if pgrep -x "transit-ticker-client/get_ticker_msg.py" > /dev/null
then
    echo 'Starting message client'
    ./transit-ticker-client/get_ticker_msg.py &
fi
