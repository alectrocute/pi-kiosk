echo "Starting setup script!";

# Remove any existing kiosk installation.
cd /home;
echo "Removing any existing kiosk installation...";
sudo rm -rf /home/pi-kiosk /home/pi/kiosk;
echo "Stopping kiosk service...";
sudo systemctl stop kiosk;
sudo systemctl disable kiosk;
echo "Removing kiosk service...";
sudo rm -rf /lib/systemd/system/kiosk.service;

# Install dependencies.
echo "Updating package list...";
sudo apt-get update -y;
echo "Installing dependencies...";
sudo apt-get install git unclutter -y;

# Clone the repository.
echo "Cloning the repository...";
sudo git clone https://github.com/alectrocute/pi-kiosk;
cd pi-kiosk;

# Install the kiosk.
echo "Installing the kiosk...";
sudo mkdir -p /home/pi/kiosk;
sudo cp kiosk.sh /home/pi/kiosk/kiosk.sh;
sudo cp kiosk.service /lib/systemd/system/kiosk.service;
echo "Enabling kiosk service...";
sudo systemctl enable kiosk.service;
echo "Setup complete!";

# Start the kiosk.
echo "Starting the kiosk...";
sudo systemctl start kiosk;
