user=$(whoami)

# finish NTPsec setup
sudo apt install scons gcc clang asciidoctor m4 bison pkg-config libssl-dev -y

sudo chmod a+x /home/$user/ALL-SKY-IMAGER/clockmaker
cd /home/$user/ALL-SKY-IMAGER/
./clockmaker --build

# enable gps service
cd /home/$user/ALL-SKY-IMAGER/gps_service/
sudo chmod a+x run_gps.sh
sudo chmod a+x startcam.sh

# create systemd service ot autostart gps service
echo "switch to root"
cd ../
sudo mv gps_service /
sudo mv autostart.service /etc/systemd/system
cd /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable --now autostart.service
exit

# restart system
echo "configuration complete--rebooting"
sudo reboot