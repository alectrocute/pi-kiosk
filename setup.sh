#!/bin/bash

COLOR_GREEN='\e[0;32m'
COLOR_RESET='\e[0m'

generate_success_message() {
    echo -e "rocket-kiosk: ${COLOR_GREEN}${1}${COLOR_RESET}";
    sleep 3;
    clear;
}

GIT_REPO_URL="https://github.com/alectrocute/pi-kiosk";
LOCAL_USER_HOME_PATH="/home/pi";
GIT_REPO_PATH="$LOCAL_USER_HOME_PATH/pi-kiosk";
EXEC_PATH="$LOCAL_USER_HOME_PATH/kiosk";
SERVICE_PATH="/lib/systemd/system/kiosk.service";

generate_success_message "Removing any existing kiosk installation...";
sudo mkdir -p $LOCAL_USER_HOME_PATH;
cd $LOCAL_USER_HOME_PATH;
sudo rm -rf $GIT_REPO_PATH $EXEC_PATH;
generate_success_message "Stopping kiosk service...";
sudo systemctl stop kiosk;
sudo systemctl disable kiosk;
generate_success_message "Removing kiosk service...";
sudo rm -rf $SERVICE_PATH;

generate_success_message "Updating package list...";
sudo apt-get update -y;
generate_success_message "Installing dependencies...";
sudo apt-get install git -y;

generate_success_message "Cloning the repository...";
sudo git clone $GIT_REPO_URL;
cd pi-kiosk;

generate_success_message "Installing the kiosk...";
sudo mkdir -p $EXEC_PATH;
sudo cp kiosk.sh $EXEC_PATH/kiosk.sh;
sudo chmod +x $EXEC_PATH/kiosk.sh;
sudo cp kiosk.service $SERVICE_PATH;
generate_success_message "Enabling kiosk service...";
sudo systemctl enable kiosk.service;
generate_success_message "Setup complete!";

# Start the kiosk.
generate_success_message "Starting the kiosk...";
sudo systemctl start kiosk;
