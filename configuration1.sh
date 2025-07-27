sudo apt update && sudo apt upgrade -y
sudo apt install python-is-python3 -y

# camera script setup
user=$(whoami)

sudo mkdir /logs
mkdir -p /home/$user/ALL-SKY-IMAGER/data
sudo apt-get install bzip2 -y
cd /home/$user/ALL-SKY-IMAGER/zwo
tar -xvf ASI_linux_mac_SDK_V1.38.tar.bz2

# necessary python modules
sudo apt install python3-numpy -y
sudo apt install python3-ephem -y
sudo apt install python3-smbus -y
sudo apt install python3-pillow -y

# NTPsec setup
#sudo chmod a+x ALL-SKY-IMAGER/clockmaker
#sudo ./ALL-SKY-IMAGER/clockmaker --config