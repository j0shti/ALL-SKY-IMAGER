user=$(whoami)

cd /home/$user/ALL-SKY-IMAGER/
./clockmaker --build
cd /home/$user/ALL-SKY-IMAGER/gps_service/
chmod a+x run_gps.sh
chmod a+x startcam.sh

