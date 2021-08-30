sudo /bin/bash -c 'echo "05 00 * * * root /home/Documents/delta/alphaq/jay_jay/schedule.sh >>/var/log/Rschedule.log 2>&1" >> /etc/crontab'
# sudo /bin/bash -c 'echo "* * * * * root /home/Documents/delta/alphaq/jay_jay/schedule.sh >>/var/log/Rschedule.log 2>&1" >> /etc/crontab'

# runs at 0005 hours (5 minutes past midnight) everyday 

# sudo /bin/bash -c 'echo "* * * * * root /home/Documents/delta/alphaq/jay_jay/schedule.sh >>/var/log/Rschedule.log 2>&1" >> /etc/crontab'

# more /etc/crontab
# ls /home/Documents/delta/alphaq/sysAd/sysAd2ndyears/sysAd_10
# sudo vim /etc/crontab
# more /var/log/Rschedule.log




# sudo /bin/bash -c 'echo "42 00 * * * root /home/Documents/delta/alphaq/jay_jay/schedule.sh >/dev/null 2>&1" >> /etc/crontab'
# sudo /bin/bash -c 'echo "42 00 * * * root /home/hedhav/Documents/schedule.sh" >> /etc/crontab'
# sudo /bin/bash -c 'echo "42 00 * * * root /home/hedhav/Documents/schedule.sh >/dev/null 2>&1" >> /etc/crontab'

# * * * * * root /home/Documents/delta/alphaq/jay_jay/schedule.sh >>/var/log/Rschedule.log 2>&1


# /home/hedhav/Documents


# /home/hedhav/Downloads/Delta/Task1/Delta/1DockerVersionOfScripts/cron_schedule.sh

# Or, run :crontab -e
# and paste the next line (in vim, go to end of file, press 'o' to edit next line, paste command, press esc. then type :w and :q)
# 05 00 * * * /home/Documents/delta/alphaq/jay_jay/schedule.sh >/dev/null 2>&1
# * * * * * /home/Documents/delta/alphaq/jay_jay/schedule.sh >>/var/log/Rschedule.log 2>&1
# 20 00 * * * /home/hedhav/Documents/schedule.sh >/dev/null 2>&1

# sudo /bin/bash -c 'echo "05 00 * * * /home/Documents/delta/alphaq/jay_jay/schedule.sh >/dev/null 2>&1" >> /etc/crontab'
# sudo /bin/bash -c 'echo "35 23 * * * root /home/hedhav/Downloads/Delta/testjob.sh" >> /etc/crontab'