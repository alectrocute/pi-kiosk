#!/bin/bash

KIOSK_URL=https://site.rocketalumnisolutions.com/home/45?touchscreen=true

# Wait for services to come online.
# TODO: It would be nice to get rid of this, but right now on Bookworm, if we
# don't wait, there are errors at boot and you have to start kiosk manually.
sleep 8

echo 'Hiding the mouse cursor...'
sudo unclutter -idle 0.1 -root &

echo 'Starting Chromium...'
sudo /usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk --app=$KIOSK_URL
