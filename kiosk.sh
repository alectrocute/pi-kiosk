#!/bin/bash

# Wait for services to come online.
# TODO: It would be nice to get rid of this, but right now on Bookworm, if we
# don't wait, there are errors at boot and you have to start kiosk manually.
sleep 8

echo 'Starting Chromium...'

flags=(
   --disable-component-update
   --disable-composited-antialiasing
   --disable-gpu-driver-bug-workarounds
   --disable-infobars
   --disable-low-res-tiling
   --disable-pinch
   --disable-session-crashed-bubble
   --disable-smooth-scrolling
   --enable-accelerated-video-decode
   --enable-gpu-rasterization
   --enable-low-end-device-mode
   --enable-oop-rasterization
   --force-device-scale-factor=1
   --ignore-gpu-blocklist
   --kiosk
   --no-first-run
   --noerrdialogs
   --disable-features=TranslateUI
   --autoplay-policy=no-user-gesture-required
)

# Standard behavior - runs chromium
chromium-browser "${flags[@]}" --app=$KIOSK_URL
