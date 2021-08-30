# cd /home/Documents/delta/alphaq


#changing head (jay_jay) perms
sudo chgrp alphaq /home/Documents/delta/alphaq
sudo chmod 750 /home/Documents/delta/alphaq
sudo chown -R jay_jay /home/Documents/delta/alphaq/jay_jay
sudo chgrp head /home/Documents/delta/alphaq/jay_jay

#sudo usermod -m -d /home/Documents/delta/alphaq/jay_jay -G alphaq,webDev,webDev3rd4thyears,webDev4thyears jay_jay

#changing webDev perms
sudo chgrp webDev /home/Documents/delta/alphaq/webDev 
sudo chgrp webDev /home/Documents/delta/alphaq/webDev/webDev2ndyears
sudo chgrp webDev3rd4thyears /home/Documents/delta/alphaq/webDev/webDev3rdyears
sudo chgrp webDev4thyears /home/Documents/delta/alphaq/webDev/webDev4thyears


sudo chmod 750 /home/Documents/delta/alphaq/webDev 
sudo chmod 750 /home/Documents/delta/alphaq/webDev/webDev2ndyears
sudo chmod 750 /home/Documents/delta/alphaq/webDev/webDev3rdyears
sudo chmod 750 /home/Documents/delta/alphaq/webDev/webDev4thyears


   for c in {01..10}
   do
      sudo chown -R webDev_${c} /home/Documents/delta/alphaq/webDev/webDev2ndyears/webDev_${c}
      sudo chgrp webDev3rd4thyears /home/Documents/delta/alphaq/webDev/webDev2ndyears/webDev_${c}
      sudo chmod 750 /home/Documents/delta/alphaq/webDev/webDev2ndyears/webDev_${c}
   done

   for (( c=11; c<=20; c++))
   do
      sudo chown -R webDev_${c} /home/Documents/delta/alphaq/webDev/webDev3rdyears/webDev_${c}
      sudo chgrp webDev4thyears /home/Documents/delta/alphaq/webDev/webDev3rdyears/webDev_${c}
      sudo chmod 750 /home/Documents/delta/alphaq/webDev/webDev3rdyears/webDev_${c}
   done

   for (( c=21; c<=30; c++))
   do
      sudo chown -R webDev_${c} /home/Documents/delta/alphaq/webDev/webDev4thyears/webDev_${c}
      sudo chgrp head /home/Documents/delta/alphaq/webDev/webDev4thyears/webDev_${c}
      sudo chmod 750 /home/Documents/delta/alphaq/webDev/webDev4thyears/webDev_${c}
   done




#changing appDev perms
sudo chgrp appDev /home/Documents/delta/alphaq/appDev 
sudo chgrp appDev /home/Documents/delta/alphaq/appDev/appDev2ndyears
sudo chgrp appDev3rd4thyears /home/Documents/delta/alphaq/appDev/appDev3rdyears
sudo chgrp appDev4thyears /home/Documents/delta/alphaq/appDev/appDev4thyears


sudo chmod 750 /home/Documents/delta/alphaq/appDev 
sudo chmod 750 /home/Documents/delta/alphaq/appDev/appDev2ndyears
sudo chmod 750 /home/Documents/delta/alphaq/appDev/appDev3rdyears
sudo chmod 750 /home/Documents/delta/alphaq/appDev/appDev4thyears


   for c in {01..10}
   do
      sudo chown -R appDev_${c} /home/Documents/delta/alphaq/appDev/appDev2ndyears/appDev_${c}
      sudo chgrp appDev3rd4thyears /home/Documents/delta/alphaq/appDev/appDev2ndyears/appDev_${c}
      sudo chmod 750 /home/Documents/delta/alphaq/appDev/appDev2ndyears/appDev_${c}
   done

   for (( c=11; c<=20; c++))
   do
      sudo chown -R appDev_${c} /home/Documents/delta/alphaq/appDev/appDev3rdyears/appDev_${c}
      sudo chgrp appDev4thyears /home/Documents/delta/alphaq/appDev/appDev3rdyears/appDev_${c}
      sudo chmod 750 /home/Documents/delta/alphaq/appDev/appDev3rdyears/appDev_${c}
   done

   for (( c=21; c<=30; c++))
   do
      sudo chown -R appDev_${c} /home/Documents/delta/alphaq/appDev/appDev4thyears/appDev_${c}
      sudo chgrp head /home/Documents/delta/alphaq/appDev/appDev4thyears/appDev_${c}
      sudo chmod 750 /home/Documents/delta/alphaq/appDev/appDev4thyears/appDev_${c}
   done




#changing sysAd perms
sudo chgrp sysAd /home/Documents/delta/alphaq/sysAd 
sudo chgrp sysAd /home/Documents/delta/alphaq/sysAd/sysAd2ndyears
sudo chgrp sysAd3rd4thyears /home/Documents/delta/alphaq/sysAd/sysAd3rdyears
sudo chgrp sysAd4thyears /home/Documents/delta/alphaq/sysAd/sysAd4thyears


sudo chmod 750 /home/Documents/delta/alphaq/sysAd 
sudo chmod 750 /home/Documents/delta/alphaq/sysAd/sysAd2ndyears
sudo chmod 750 /home/Documents/delta/alphaq/sysAd/sysAd3rdyears
sudo chmod 750 /home/Documents/delta/alphaq/sysAd/sysAd4thyears


   for c in {01..10}
   do
      sudo chown -R sysAd_${c} /home/Documents/delta/alphaq/sysAd/sysAd2ndyears/sysAd_${c}
      sudo chgrp sysAd3rd4thyears /home/Documents/delta/alphaq/sysAd/sysAd2ndyears/sysAd_${c}
      sudo chmod 750 /home/Documents/delta/alphaq/sysAd/sysAd2ndyears/sysAd_${c}
   done

   for (( c=11; c<=20; c++))
   do
      sudo chown -R sysAd_${c} /home/Documents/delta/alphaq/sysAd/sysAd3rdyears/sysAd_${c}
      sudo chgrp sysAd4thyears /home/Documents/delta/alphaq/sysAd/sysAd3rdyears/sysAd_${c}
      sudo chmod 750 /home/Documents/delta/alphaq/sysAd/sysAd3rdyears/sysAd_${c}
   done

   for (( c=21; c<=30; c++))
   do
      sudo chown -R sysAd_${c} /home/Documents/delta/alphaq/sysAd/sysAd4thyears/sysAd_${c}
      sudo chgrp head /home/Documents/delta/alphaq/sysAd/sysAd4thyears/sysAd_${c}
      sudo chmod 750 /home/Documents/delta/alphaq/sysAd/sysAd4thyears/sysAd_${c}
   done



echo "done with permit.sh"