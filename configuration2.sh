user=$(whoami)

# finish NTPsec setup
sudo apt install scons gcc clang asciidoctor -y

chmod a+x /home/$user/ALL-SKY-IMAGER/clockmaker
cd /home/$user/ALL-SKY-IMAGER/
./clockmaker --build

# enable gps service
cd /home/$user/ALL-SKY-IMAGER/gps_service/
chmod a+x run_gps.sh
chmod a+x startcam.sh
mv startcam.sh /

# create systemd service ot autostart gps service
sudo -s
mv /home/$user/ALL-SKY-IMAGER/autostart.service /etc/systemd/system
cd /etc/systemd/system
systemctl enable --now autostart.service
