sudo apt update && sudo apt upgrade -y
sudo apt install python-is-python3 -y

# camera script setup
user=$(whoami)

sudo mkdir /logs
mkdir -p /home/$user/ALL-SKY-IMAGER/data
sudo apt-get install bzip2 -y
cd /home/$user/ALL-SKY-IMAGER/zwo
tar -xvf ASI_linux_mac_SDK_V1.38.tar.bz2

# necessary python modules for CAMERA
sudo apt install python3-numpy -y
sudo apt install python3-ephem -y
sudo apt install python3-smbus -y
sudo apt install python3-pillow -y

# finish NTP gpsd setup
sudo apt install gpsd gpsd-clients chrony -y

cp -f chrony.conf /etc/chrony/chrony.conf
cp -f gpsd /etc/default/gpsd

# enable gps service
cd /home/$user/ALL-SKY-IMAGER/gps_service/
sudo chmod a+x run_gps.sh
sudo chmod a+x startcam.sh

# create systemd service ot autostart gps service
cd ../
sudo mv gps_service /
sudo mv autostart.service /etc/systemd/system
cd /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable --now autostart.service

# restart system
echo "configuration complete--rebooting"
sudo reboot

