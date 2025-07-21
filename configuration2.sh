user=$(whoami)

# finish NTPsec setup
sudo apt install scons gcc clang asciidoctor m4 bison pkg-config libssl-dev -y

sudo chmod a+x /home/$user/ALL-SKY-IMAGER/clockmaker
cd /home/$user/ALL-SKY-IMAGER/
./clockmaker --build

# enable gps service
cd /home/$user/ALL-SKY-IMAGER/gps_service/
sudo chmod a+x run_gps.sh

# create systemd service ot autostart gps service
sudo -s
cd ../
sudo chmod a+x startcam.sh
mv startcam.sh /
mv autostart.service /etc/systemd/system
cd /etc/systemd/system
systemctl daemon-reload
systemctl enable --now autostart.service
exit

# restart system
echo "configuration complete--rebooting"
reboot