FROM python:3.9.6


RUN apt-get update && apt-get -y install sudo
RUN pip3 install pycryptodome


# docker build -t "testserver:v1.0" . 
# docker run -t -i testserver:v1.0




# ADD ./sample.txt /home/Documents/delta/users/sample.txt
# ADD ./test.txt /home/Documents/delta/users/test.txt
# ADD ./test1.txt /home/Documents/delta/users/test1.txt



# ADD ./sample.txt /home/Documents/tempfiles/sample.txt
# ADD ./test.txt /home/Documents/tempfiles/test.txt
# ADD ./test1.txt /home/Documents/tempfiles/test1.txt


RUN /bin/bash -c "groupadd sysAd"
RUN /bin/bash -c "groupadd webDev"
RUN /bin/bash -c "groupadd appDev"

RUN mkdir -p /home/Documents/delta/users/
RUN mkdir -p /home/Documents/delta/fileserver/filestorage

ADD ./setup.sh /home/Documents/tempfiles/setup.sh
ADD ./server.py /home/Documents/delta/fileserver/server.py
ADD ./client.py /home/Documents/delta/users/client.py



ENTRYPOINT [ "python", "/home/Documents/delta/fileserver/server.py" ]

# docker-compose build
# docker-compose up -d
# docker ps -a
# #sudo docker exec -it  bash
# cd /home/Documents/delta/fileserver/
# python3 /home/Documents/delta/fileserver/server.py







# docker-compose build --no-cache [<service_name>..]
# docker-compose up --force-recreate --no-deps -d 
# docker ps -a
# sudo docker exec -it <containerID> bash
# bash /home/Documents/serversetup.sh
