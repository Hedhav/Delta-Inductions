# Onsites

## Task 1

Run:

    bash script.sh

to combine and sort all 3 files. Output is stored in file.txt

Change coloumn values: Run:

    bash script2.sh changecol <affectedColoumn> <oldValue> <newValue>

eg:

    bash script2.sh changecol employeeId 805347 123456

output is stored in newfile.txt



## Task 2

Run: (copy contents of config to here. )

        sudo nano /etc/apache2/sites-available/000-default.conf
        
paste "127.0.1.1 loadbalance.local" here

                sudo nano /etc/hosts
                
move index.php to /var/www/html/

Run:

                sudo a2enmod proxy
                sudo a2enmod proxy_http
                sudo a2enmod proxy_balancer
                sudo a2enmod lbmethod_byrequests
                sudo a2enmod headers
                service apache2 restart
                docker-compose up -d
                
                
 Visit loadbalance.local to connect to the server.



## Task 3

copy files to /var/www/html and visit localsite.

The username must be a valid NITT roll number of a current UG student(assuming 200 students per batch). The password must have uppercase and lowercase letters, numbers, and special characters. The generated captcha code is a random 7 character alphanumeric string with lines in the image background.



## Task 4

copy contents to a folder. Put all files to be watched under the login.local folder. 

        bash script.sh

All changes made within the files in the login.local folder (including files in sub-directories) will be detected and the containers will be rebuilt and redeployed.




## Task 5

        g++ test3.cpp -o gensha384 && ./gensha384

Input the string to obtain SHA-384 hashed version of it.
The python script (test.py) DOES NOT WORK. (Way too many errors)


# Tasks



## Docker-Task-1,2

### Initial Setup
Copy all contents of this repository to any common folder

Run the following commands:


docker-compose up -d

docker ps -a
#### web-server container
sudo docker exec -it < web-server container ID> bash'
 (< web-server container ID> obtained from 'docker ps -a')
 
Now run:
bash /home/Documents/webserversetup.sh

exit
 
 
 #### database container
sudo docker exec -it < Database container ID> bash'
 (< Database container ID> obtained from 'docker ps -a')

Now run:
bash /home/Documents/serversetup.sh

### Accessing the folders
the server directory is  located at /home/Documents/delta (which is the directory that will be opened after running serversetup.sh)

jay_jay is a sudoer with password 'jayjaydabest'

### Accessing the Webpages
go to http://localhost:8080/moms.local.php to view all MoMs

To access the webpages, go to http://localhost:8080/
use AnuRag, superuserpass (default) to login  (~~Extra features coming soon, hopefully with a website style that doesn't look like it was made by a child~~, Features added and styling done :)  )

you can filter and view MoMs (leave filter fields blank to view all)

You can also create MoMs here. (if the MoM_taker is left blank, it will default to the username used to login at index.php)

Log out deletes session cookies

for remember me to work, check the box when logging in. In the future, go to http://localhost:8080/ to get automatically logged in




## Docker-Task-3

### Server Script
Run:

            docker-compose up -d

 This will get the server up and running (on port 5019)

### Client Script

            python3 client.py

Passwords for the respective domains: 
sysAd = 'SysAd Rocks' ; appDev = 'AppDev Rules' ; webDev = 'WebDev over all'


### Available Functions

List - List: View all available files, corresponding to the domain

Download - DL: Enter filename, when prompted (file should be one present among those listed in List

Upload - UL: Enter filename, when prompted (file should be one present in cwd of client script

Delete - Delete: Enter filename, when prompted (file should be one present among those listed in List

Search - Search: Enter filename, when prompted (Enter 'all', for searching through all available, accessible files). Then enter the regex search expression, when prompted. 

Logout - Logout: Logs client out of the server



### Additional info:
  
All transferred files are AES-256 encrypted

Make sure the name of the uploaded file doesn't match with any existing filename that has been uploaded, as the file will be overwritten
  
The files are stored in a folder that is mounted on a volume, which will ensure uploaded files are preserved even if server is taken down and deployed again. 








