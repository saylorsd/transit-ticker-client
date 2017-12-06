#!/bin/bash

# install.sh
# installs everything for transit ticker
# TODO: have user enter ticker id
# TODO: have user enter host establishment's wifi credentials

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pwd

# install python requirements
echo "Installing python requirements..."
pip install -r $DIR/requirements.txt


# get ticker id
echo "Enter Ticker ID:"
read ticker_id
echo $ticker_id > $DIR/ticker_id

# Set up cronjob to constantly check that it's running
echo "Setting up monitor script..."
# give execute permission to run_ticker script
chmod +x run_ticker.sh

# add cronjob for run_ticker.sh
TEMPCRON=/home/pi/tempcron

## copy current cronjob
if crontab -l | grep -q "run_ticker.sh";
then
  echo "Cron job already set."
else
  echo "Adding cronjob..."
  crontab -l > $TEMPCRON
  echo "*/2 * * * * /home/pi/transit-ticker-client/run_ticker.sh" >> $TEMPCRON
  crontab $TEMPCRON
fi

# Run script
echo "Starting ticker..."
/home/pi/transit-ticker-client/run_ticker.sh
echo "Ticker ready..."
