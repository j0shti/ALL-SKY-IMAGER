tar -xvf ASI_linux_mac_SDK_V1.38.tar.bz2
sudo apt install python3-ephem -y
sudo apt install python3-smbus -y
sudo apt install python3-pillow -y

# NTPsec setup
sudo chmod a+x ALL-SKY-IMAGER/clockmaker
sudo ./ALL-SKY-IMAGER/clockmaker --config