# mkdir /home/Documents/delta/users/
# mkdir /home/Documents/delta/fileserver/

# cp /home/Documents/tempfiles/sample.txt /home/Documents/delta/users/sample.txt
# cp /home/Documents/tempfiles/test.txt /home/Documents/delta/users/test.txt
# cp /home/Documents/tempfiles/test1.txt /home/Documents/delta/users/test1.txt


# cp /home/Documents/tempfiles/sample.txt /home/Documents/delta/fileserver/sample.txt
# cp /home/Documents/tempfiles/test.txt /home/Documents/delta/fileserver/test.txt
# cp /home/Documents/tempfiles/test1.txt /home/Documents/delta/fileserver/test1.txt


# chgrp sysAd /home/Documents/delta/fileserver/sample.txt
# chgrp webDev /home/Documents/delta/fileserver/test1.txt
# chgrp appDev /home/Documents/delta/fileserver/test.txt


cp /home/Documents/tempfiles/sample.txt /home/Documents/delta/fileserver/filestorage/sample.txt
cp /home/Documents/tempfiles/test.txt /home/Documents/delta/fileserver/filestorage/test.txt
cp /home/Documents/tempfiles/test1.txt /home/Documents/delta/fileserver/filestorage/test1.txt

chgrp sysAd /home/Documents/delta/fileserver/filestorage/sample.txt
chgrp webDev /home/Documents/delta/fileserver/filestorage/test1.txt
chgrp appDev /home/Documents/delta/fileserver/filestorage/test.txt

# cp /home/Documents/tempfiles/client.py /home/Documents/delta/users/client.py
# cp /home/Documents/tempfiles/server.py /home/Documents/delta/fileserver/server.py


cd /home/Documents/delta/fileserver/
python3 /home/Documents/delta/fileserver/server.py



# cd /home/Documents/delta/users/
# bash /home/Documents/delta/users/client10.py

