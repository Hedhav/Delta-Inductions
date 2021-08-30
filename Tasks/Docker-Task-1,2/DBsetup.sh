# create database
sudo mysql -uroot -prootpsswrd -e "CREATE DATABASE alphaq;" -e "use alphaq;" -e "CREATE TABLE MoMs(date varchar(10), MoMtaker varchar(9),  MoM varchar(1000), PRIMARY KEY ( date ));"

#create user jayjay (admin)
sudo mysql -uroot -prootpsswrd -e "CREATE USER 'jayjay'@'%' IDENTIFIED BY 'jayjaydabest';" -e "GRANT ALL PRIVILEGES ON *.* TO 'jayjay'@'%';" -e "FLUSH PRIVILEGES;"


# create user viewer (with read-only permissions of the DB)
sudo mysql -uroot -prootpsswrd -e "CREATE USER 'viewer'@'%' IDENTIFIED BY 'justlookingaround';" -e "GRANT SELECT, SHOW VIEW  ON alphaq.* TO 'viewer'@'%';" -e "FLUSH PRIVILEGES;"


sudo mysql -uroot -prootpsswrd -e "SET GLOBAL local_infile=1;" # -e "SET GLOBAL validate_password.policy = 0;"

sudo mysql -uroot -prootpsswrd -e "CREATE USER 'webadmin'@'%' IDENTIFIED WITH mysql_native_password BY 'rulingdaweb';" -e "GRANT ALL PRIVILEGES ON *.* TO 'webadmin'@'%';" -e "FLUSH PRIVILEGES;"


# sudo mysql -uroot -prootpsswrd -e "CREATE USER 'admin'@'localhost' IDENTIFIED WITH mysql_native_password BY 'yourpass';" -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';" -e "FLUSH PRIVILEGES;"

sudo mysql -uroot -prootpsswrd -e "use alphaq;" -e "CREATE TABLE users (user_name varchar(32), password varchar(32), domain varchar(10), PRIMARY KEY ( user_name ));" -e "INSERT INTO users (user_name, password, domain) VALUES ('AnuRag', 'superuserpass', 'admin');"

for c in {01..30}
do  
    sudo mysql -uroot -prootpsswrd -e "use alphaq;" -e "INSERT INTO users (user_name, password, domain) VALUES ('sysAd_${c}', 'superuserpass', 'sysAd');" -e "INSERT INTO users (user_name, password, domain) VALUES ('webDev_${c}', 'superuserpass', 'webDev');"  -e "INSERT INTO users (user_name, password, domain) VALUES ('appDev_${c}', 'superuserpass', 'appDev');"
done



echo "Done with DBsetup.sh"



# sudo mysql -uroot -prootpsswrd -e "use alphaq;" -e "INSERT INTO MoMs (date, MoMtaker, MoM) VALUES ('55-55-5555', 'dumbass1', 'randomshit5');" -e "INSERT INTO MoMs (date, MoMtaker, MoM) VALUES ('56-55-5555', 'dumbass2', 'randomshit2');"