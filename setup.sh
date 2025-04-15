echo "Starting setup script!";
sudo apt-get update -y;
sudo apt-get install git unclutter;
cd /home;
git clone https://github.com/alectrocute/pi-kiosk;
cd pi-kiosk;
mkdir -p /home/pi/kiosk;
cp kiosk.sh /home/pi/kiosk/kiosk.sh
sudo cp kiosk.service /lib/systemd/system/kiosk.service;
sudo systemctl enable kiosk.service;
echo "Setup complete!";
sleep 2;
sudo systemctl start kiosk;
