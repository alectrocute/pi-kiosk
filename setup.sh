#!/bin/bash

clear;
echo "Starting setup script!";

GIT_REPO_URL="https://github.com/alectrocute/pi-kiosk";
LOCAL_USER_HOME_PATH="/home/pi";
GIT_REPO_PATH="$LOCAL_USER_HOME_PATH/pi-kiosk";
EXEC_PATH="$LOCAL_USER_HOME_PATH/kiosk";
SERVICE_PATH="/lib/systemd/system/kiosk.service";

echo "Removing any existing kiosk installation...";
sudo mkdir -p $LOCAL_USER_HOME_PATH;
cd $LOCAL_USER_HOME_PATH;
sudo rm -rf $GIT_REPO_PATH $EXEC_PATH;
echo "Stopping kiosk service...";
sudo systemctl stop kiosk;
sudo systemctl disable kiosk;
echo "Removing kiosk service...";
sudo rm -rf $SERVICE_PATH;
clear;

echo "Updating package list...";
sudo apt-get update -y;
echo "Installing dependencies...";
sudo apt-get install git -y;
clear;

echo "Cloning the repository...";
sudo git clone $GIT_REPO_URL;
cd pi-kiosk;
clear;

echo "Installing the kiosk...";
sudo mkdir -p $EXEC_PATH;
sudo cp kiosk.sh $EXEC_PATH/kiosk.sh;
sudo chmod +x $EXEC_PATH/kiosk.sh;
sudo cp kiosk.service $SERVICE_PATH;
echo "Enabling kiosk service...";
sudo systemctl enable kiosk.service;
echo "Setup complete!";
sleep 2;
clear;

# Start the kiosk.
echo "Starting the kiosk...";
sudo systemctl start kiosk;
