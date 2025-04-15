#!/bin/bash

# Wait for services to come online.
# TODO: It would be nice to get rid of this, but right now on Bookworm, if we
# don't wait, there are errors at boot and you have to start kiosk manually.
sleep 8

echo 'Hiding the mouse cursor...'
sudo unclutter -idle 0.1 -root &

echo 'Starting Chromium...'
/usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk --touch-events=enabled --disable-pinch --overscroll-history-navigation=0 --autoplay-policy=no-user-gesture-required --app=$KIOSK_URL
