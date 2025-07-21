user=$(whoami)

# finish NTPsec setup
sudo apt install scons gcc clang asciidoctor m4 bison pkg-config libssl-dev -y

chmod a+x /home/$user/ALL-SKY-IMAGER/clockmaker
cd /home/$user/ALL-SKY-IMAGER/
./clockmaker --build

# enable gps service
cd /home/$user/ALL-SKY-IMAGER/gps_service/
chmod a+x run_gps.sh
chmod a+x startcam.sh

# create systemd service ot autostart gps service
sudo -s
cd ../
mv startcam.sh /
mv autostart.service /etc/systemd/system
cd /etc/systemd/system
systemctl daemon-reload
systemctl enable --now autostart.service

# restart system
echo "configuration complete--rebooting"
reboot