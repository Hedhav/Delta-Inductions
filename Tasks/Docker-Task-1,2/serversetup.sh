# serversetup.sh

bash /home/Documents/genpermit2.sh
bash /home/Documents/DBsetup.sh

sudo chown jay_jay /home/Documents/genuser.sh
sudo chown jay_jay /home/Documents/DBsetup.sh
sudo chown jay_jay /home/Documents/permit.sh
sudo chown jay_jay /home/Documents/genpermit2.sh


sudo chmod 700 /home/Documents/genuser.sh
sudo chmod 700 /home/Documents/DBsetup.sh
sudo chmod 700 /home/Documents/permit.sh
sudo chmod 700 /home/Documents/genpermit2.sh

# Create necessary folders and database

# Move files to locations
cp /home/Documents/tempfiles/schedule.sh /home/Documents/schedule.sh
cp /home/Documents/tempfiles/cron_schedule.sh /home/Documents/cron_schedule.sh

mv /home/Documents/tempfiles/schedule.sh /home/Documents/delta/alphaq/jay_jay/schedule.sh
mv /home/Documents/tempfiles/cron_schedule.sh /home/Documents/delta/alphaq/jay_jay/cron_schedule.sh
mv /home/Documents/tempfiles/attendance.sh /home/Documents/delta/alphaq/jay_jay/attendance.sh
mv /home/Documents/tempfiles/future.txt /home/Documents/delta/alphaq/jay_jay/future.txt
mv /home/Documents/tempfiles/attendance.txt /home/Documents/delta/alphaq/jay_jay/attendance.txt
mv /home/Documents/tempfiles/conv2db.sh /home/Documents/delta/alphaq/jay_jay/conv2db.sh
mv /home/Documents/tempfiles/getMoM.sh /home/Documents/delta/alphaq/jay_jay/getMoM.sh
mv /home/Documents/tempfiles/genMoM.sh /home/Documents/delta/alphaq/jay_jay/genMoM.sh


# mv /home/Documents/tempfiles/DBsetup.sh /home/Documents/delta/alphaq/jay_jay/DBsetup.sh
 
# sudo mv  /home/Documents/tempfiles /home/Documents/delta/alphaq/jay_jay/ 

# sudo mv /home/Documents/delta/alphaq/jay_jay/genMoM.sh /home/Documents/testcase/
# mv /home/Documents/tempfiles/DispMoM.php /var/www/html/DispMoM.php



# Give them run permissions      
sudo chmod -R 750 /home/Documents/delta/alphaq/jay_jay/
# chmod +x /home/Documents/delta/alphaq/jay_jay/schedule.sh
# chmod +x /home/Documents/delta/alphaq/jay_jay/cron_schedule.sh
# chmod +x /home/Documents/delta/alphaq/jay_jay/attendance.sh
# chmod +x /home/Documents/delta/alphaq/jay_jay/conv2db.sh
# chmod +x /home/Documents/delta/alphaq/jay_jay/getMoM.sh
# chmod +x /home/Documents/delta/alphaq/jay_jay/genMoM.sh
# chmod +x /home/Documents/delta/alphaq/jay_jay/DBsetup.sh



sudo chown root /home/Documents/delta/alphaq/jay_jay/cron_schedule.sh
# sudo bash /home/Documents/delta/alphaq/jay_jay/cron_schedule.sh

# bashrc stuff (alias)
echo "alias genuser='sudo bash /home/Documents/genuser.sh'">> ~/.bashrc
echo "alias permit='sudo bash /home/Documents/permit.sh'">> ~/.bashrc

echo "alias DBsetup='sudo bash /home/Documents/tempfiles/DBsetup.sh'">> /home/Documents/delta/alphaq/jay_jay/.bashrc
echo "alias schedule='sudo bash /home/Documents/delta/alphaq/jay_jay/schedule.sh'">> /home/Documents/delta/alphaq/jay_jay/.bashrc
echo "alias attendance='sudo bash /home/Documents/delta/alphaq/jay_jay/attendance.sh absentees'">> /home/Documents/delta/alphaq/jay_jay/.bashrc
echo "alias getMoM='sudo bash /home/Documents/delta/alphaq/jay_jay/getMoM.sh'">> /home/Documents/delta/alphaq/jay_jay/.bashrc
echo "alias genMoM='sudo bash /home/Documents/delta/alphaq/jay_jay/genMoM.sh'">> /home/Documents/delta/alphaq/jay_jay/.bashrc
echo "alias conv2db='sudo bash /home/Documents/delta/alphaq/jay_jay/conv2db.sh'">> /home/Documents/delta/alphaq/jay_jay/.bashrc


echo "alias DBsetup1='sudo bash /home/Documents/tempfiles/DBsetup.sh'" | sudo tee -a /etc/bash.bashrc
echo "alias schedule1='sudo bash /home/Documents/delta/alphaq/jay_jay/schedule.sh'" | sudo tee -a /etc/bash.bashrc
echo "alias attendance1='sudo bash /home/Documents/delta/alphaq/jay_jay/attendance.sh absentees'" | sudo tee -a /etc/bash.bashrc
echo "alias getMoM1='sudo bash /home/Documents/delta/alphaq/jay_jay/getMoM.sh'" | sudo tee -a /etc/bash.bashrc
echo "alias genMoM1='sudo bash /home/Documents/delta/alphaq/jay_jay/genMoM.sh'" | sudo tee -a /etc/bash.bashrc
echo "alias conv2db1='sudo bash /home/Documents/delta/alphaq/jay_jay/conv2db.sh'" | sudo tee -a /etc/bash.bashrc


rm -rf /home/Documents/tempfiles
# cd /home/Documents/delta
echo "Done with serversetup.sh"