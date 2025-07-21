user=$(whoami)

# finish NTPsec setup
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
cd /etc/systemd/system
