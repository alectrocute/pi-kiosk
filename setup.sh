echo "Starting setup script!";
sudo apt-get update -y;
sudo apt-get install git unclutter;
cd /home;
sudo git clone https://github.com/alectrocute/pi-kiosk;
cd pi-kiosk;
sudo mkdir -p /home/pi/kiosk;
sudo cp kiosk.sh /home/pi/kiosk/kiosk.sh
sudo cp kiosk.service /lib/systemd/system/kiosk.service;
sudo systemctl enable kiosk.service;
echo "Setup complete!";
sleep 2;
sudo systemctl start kiosk;
