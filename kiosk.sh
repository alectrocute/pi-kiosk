#!/bin/bash

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
   # ai suggested the following flags:
   --disable-background-networking
   --disable-background-timer-throttling
   --disable-breakpad
   --disable-client-side-phishing-detection
   --disable-default-apps
   --disable-dev-shm-usage
   --disable-extensions
   --disable-features=TranslateUI
   --disable-hang-monitor
   --disable-popup-blocking
   --disable-prompt-on-repost
   --disable-sync
   --disable-translate
   --metrics-recording-only
   --no-default-browser-check
   --no-pings
   --password-store=basic
   --use-mock-keychain
)

# Standard behavior - runs chromium
echo "Starting Chromium with flags: ${flags[@]}"

chromium-browser "${flags[@]}" --app=$KIOSK_URL
