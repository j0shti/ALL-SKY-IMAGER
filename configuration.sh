sudo apt update && sudo apt upgrade -y
sudo apt install python-is-python3

sudo mkdir /logs
mkdir -p /ALL-SKY-IMAGER/data
sudo apt-get install bzip2
cd ALL-SKY-IMAGER/zwo
tar -xvf ASI_linux_mac_SDK_V1.38.tar.bz2
chmod a+x ALL-SKY-IMAGER/clockmaker
sudo ./ALL-SKY-IMAGER/clockmaker --config