#!/bin/bash

log_msg() {
    COLOR_GREEN='\e[0;32m'
    COLOR_RESET='\e[0m'
    echo -e "rocket-kiosk: ${COLOR_GREEN}${1}${COLOR_RESET}";
}

GIT_REPO_URL="https://github.com/alectrocute/pi-kiosk";
LOCAL_USER_HOME_PATH="/home/pi";
GIT_REPO_PATH="$LOCAL_USER_HOME_PATH/pi-kiosk";
EXEC_PATH="$LOCAL_USER_HOME_PATH/kiosk";
SERVICE_PATH="/lib/systemd/system/kiosk.service";

log_msg "Removing any existing kiosk installation...";
sudo mkdir -p $LOCAL_USER_HOME_PATH;
cd $LOCAL_USER_HOME_PATH;
sudo rm -rf $GIT_REPO_PATH $EXEC_PATH;
log_msg "Stopping kiosk service...";
sudo systemctl stop kiosk;
sudo systemctl disable kiosk;
log_msg "Removing kiosk service...";
sudo rm -rf $SERVICE_PATH;

log_msg "Updating package list...";
sudo apt-get update -y;
log_msg "Installing dependencies...";
sudo apt-get install git -y;

log_msg "Cloning the repository...";
sudo git clone $GIT_REPO_URL;
cd pi-kiosk;

log_msg "Installing the kiosk...";
sudo mkdir -p $EXEC_PATH;
sudo cp kiosk.sh $EXEC_PATH/kiosk.sh;
sudo chmod +x $EXEC_PATH/kiosk.sh;
sudo cp kiosk.service $SERVICE_PATH;
log_msg "Enabling kiosk service...";
sudo systemctl enable kiosk.service;
log_msg "Setup complete!";

# Start the kiosk.
log_msg "Starting the kiosk...";
sudo systemctl start kiosk;
