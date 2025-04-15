echo "Starting setup script!";

# Remove any existing kiosk installation.
sudo rm -rf /home/pi-kiosk;
sudo rm -rf /home/pi;
sudo systemctl stop kiosk;
sudo systemctl disable kiosk;
sudo rm -rf /lib/systemd/system/kiosk.service;

# Install dependencies.
sudo apt-get update -y;
sudo apt-get install git unclutter -y;

# Clone the repository.
cd /home;
sudo git clone https://github.com/alectrocute/pi-kiosk;
cd pi-kiosk;

# Install the kiosk.
sudo mkdir -p /home/pi/kiosk;
sudo cp kiosk.sh /home/pi/kiosk/kiosk.sh;
sudo cp kiosk.service /lib/systemd/system/kiosk.service;
sudo systemctl enable kiosk.service;
echo "Setup complete!";

# Start the kiosk.
sleep 6;
sudo systemctl start kiosk;
