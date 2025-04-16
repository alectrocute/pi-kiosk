#!/bin/bash

# Wait for services to come online.
# TODO: It would be nice to get rid of this, but right now on Bookworm, if we
# don't wait, there are errors at boot and you have to start kiosk manually.
sleep 8

flags=(
   --disable-component-update
   --disable-gpu-driver-bug-workarounds
   --disable-infobars
   --disable-low-res-tiling
   --disable-pinch
   --disable-session-crashed-bubble
   --enable-accelerated-video-decode
   --enable-gpu-rasterization
   # --enable-low-end-device-mode
   # --disable-smooth-scrolling
   --disable-composited-antialiasing
   --enable-oop-rasterization
   --force-device-scale-factor=1
   --ignore-gpu-blocklist
   --no-first-run
   --noerrdialogs
   --autoplay-policy=no-user-gesture-required
   --kiosk
)

# Standard behavior - runs chromium
echo "Starting Chromium with flags: ${flags[@]}"

chromium-browser "${flags[@]}" --app=$KIOSK_URL
