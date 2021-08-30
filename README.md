# Onsites

## Task 1

Merge all the three files (file1,fil2,file3) into one, avoiding duplicates i.e. the merged file will consist of the columns: Employee ID, Name, Phone Number, Salary, Email and year of joining.

Also ensure that all the entries in the three files match with the final one. Finally, you have to write a script which takes a column name and it's entry as paramaters and replaces it with the third parameter. If multiple rows have the same values, all of them should be replaced.


Run:

    bash script.sh

to combine and sort all 3 files. Output is stored in file.txt

Change coloumn values: Run:

    bash script2.sh changecol <affectedColoumn> <oldValue> <newValue>

eg:

    bash script2.sh changecol employeeId 805347 123456

output is stored in newfile.txt



## Task 2

Load Balancer

Accept requests to loadbalance.local. Figure out the type of device used by the user from the request and redirect the request to the appropriate load balancer (desktop/mobile). The desktop and mobile loadbalancers redirect all incoming requests to their two servers each



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

Attempt at implementing a SHA-384 hash function to accept any plain text and give the hash as output without using any libraries that directly do the hashing.

        g++ test3.cpp -o gensha384 && ./gensha384

Input the string to obtain SHA-384 hashed version of it.
The python script (test.py) DOES NOT WORK. (Way too many errors)


# Tasks



## Docker-Task-1,2


### Task Requirement

* (alias - genUser) Set up 30 user accounts for each domain + 1 Alpha Q head with permission management. The users must be named as follows:
sysAd_01, sysAd_02 ….sysAd_30,  appDev_01, appDev_02, ….appDev_30,  webDev_01, webDev_02, ….webDev_30
Jay_Jay (head of Alpha Q). 
Among these accounts, profile_01 - profile_10 are second years, profile_11 - profile_20 are third years, profile_21 - profile_30 are fourth years.

* (alias - permit) Set up permissions for accounts which follow the hierarchy:
Second years can view only their own home directory. 
Third years can view their own home directory as well as all the home directories of second years of their domain.
Fourth years can view their own home directory as well as the home directories of second and third years of their domain.
Jay_Jay can read all the other users' home directories.

* (alias - schedule) Alpha Q has regular meetings to discuss what their members are working on frequently. You are provided with a text file with the dates of future meetings(future.txt). Create a file schedule in each user's home directory with two columns, date and time. This file should be updated with the meeting schedule if there is a meeting that day.

Using attendance.log:

* (alias - attendance) You are given a log of when members joined the meetings in a file attendance.log. Write a script for the head to get a list of members who were absent when passed two dates as parameters. If no arguments are passed then find the absentees and the dates they were absent till today.

* (alias - genMoM) The last second year to join a meet is repsonsible for taking MoM (Minutes of Meeting; a doc where the main points of the meet are jotted down). Find the last second year to join the meet. In that user's home directory, create a file with the name in the format ${date}_mom, where ${date} represents the date of the particular meeting. Add some random text to it.

* (alias - getMoM) The head should be able to view the MoM records between two given dates. Create a script which the head can run to generate a file in their home directory with a table having each week’s MoMs, along with the person who took the MoM and the date. The MoM should be obtained from the MoM taker’s home directory.

__________________________________________________________________

* Create a database to store MoMs instead of files in the users' directory. 

* Make sure restarting the docker container does not destroy the data.

* Add PHPMyAdmin service for viewing the database.

* Create an account with read-only permissions to read the MOMs present in the DB.



* Create a website to display all the MOMs inserted into the SQL database

* Implement a feature to login using username and password. Set default password as superuserpass for simplicity.

* Implement a Remember Me feature.

* Feature to write and save MOMs from the website.

* Feature to filter the MOMs based on username and date.


* Dockrize the entire setup


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
        
        exit

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

