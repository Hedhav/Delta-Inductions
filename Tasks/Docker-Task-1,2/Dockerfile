# docker-compose up -d
# docker ps -a
# sudo docker exec -it < Database container ID> bash
# bash /home/Documents/serversetup.sh

# bash /home/Documents/webserversetup.sh
# in php container

# new files: createacc, allusers


FROM mysql:8.0.25

# VOLUME ["/var/lib/mysql"]
# VOLUME ["/home/Documents/delta"]

RUN apt-get update && apt-get -y install sudo
RUN apt-get install -y cron
RUN apt-get -y install vim


# just addition and running of files
ADD ./genuser.sh /home/Documents/genuser.sh
ADD ./permit.sh /home/Documents/permit.sh
ADD ./serversetup.sh /home/Documents/serversetup.sh
ADD ./DBsetup.sh /home/Documents/DBsetup.sh
ADD ./genuser.sh /home/Documents/genuser.sh
ADD ./permit.sh /home/Documents/permit.sh
ADD ./genuser1.sh /home/Documents/genuser1.sh
ADD ./genpermit2.sh /home/Documents/genpermit2.sh


RUN chmod +x /home/Documents/genuser.sh
RUN chmod +x /home/Documents/permit.sh
RUN chmod +x /home/Documents/serversetup.sh
RUN chmod +x /home/Documents/DBsetup.sh
RUN chmod +x /home/Documents/genuser.sh
RUN chmod +x /home/Documents/permit.sh
RUN chmod +x /home/Documents/genuser1.sh
RUN chmod +x /home/Documents/genpermit2.sh


ADD ./schedule.sh /home/Documents/tempfiles/schedule.sh
ADD ./cron_schedule.sh /home/Documents/tempfiles/cron_schedule.sh
ADD ./attendance.sh /home/Documents/tempfiles/attendance.sh
ADD ./future.txt /home/Documents/tempfiles/future.txt
ADD ./attendance.txt /home/Documents/tempfiles/attendance.txt
ADD ./conv2db.sh /home/Documents/tempfiles/conv2db.sh
ADD ./getMoM.sh /home/Documents/tempfiles/getMoM.sh
ADD ./genMoM.sh /home/Documents/tempfiles/genMoM.sh

RUN /bin/bash -c "/home/Documents/genuser1.sh"
# RUN /bin/bash -c "/home/Documents/permit.sh"
# RUN /home/Documents/genuser.sh
# RUN /home/Documents/permit.sh



# docker-compose build --no-cache [<service_name>..]
# docker-compose up --force-recreate --no-deps -d 
# docker ps -a
# sudo docker exec -it <containerID> bash
# bash /home/Documents/serversetup.sh