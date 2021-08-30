mkdir -p /home/Documents/delta/alphaq   
sudo groupadd alphaq

mkdir -p /home/Documents/delta/alphaq/jay_jay/tempfiles

groupadd head
groupadd 2ndyears

sudo useradd -g head -G alphaq jay_jay
#making initial directories and assigning jay_jay perms





#Adding directories if they dont already exist
if [[ ! -f "sysAd/sysAd4thyears/sysAd_30" ]]
then


   #adding webDev stuff
   mkdir -p /home/Documents/delta/alphaq/webDev/webDev2ndyears
   mkdir -p /home/Documents/delta/alphaq/webDev/webDev3rdyears
   mkdir -p /home/Documents/delta/alphaq/webDev/webDev4thyears


   groupadd webDev2ndyears
   groupadd webDev3rdyears
   groupadd webDev4thyears
   groupadd webDev3rd4thyears
   groupadd webDev


   for c in {01..10}
   do
      mkdir -p /home/Documents/delta/alphaq/webDev/webDev2ndyears/webDev_${c}
      sudo useradd -g webDev2ndyears -G webDev,alphaq,2ndyears webDev_${c}
      sudo usermod -m -d /home/Documents/delta/alphaq/webDev/webDev2ndyears/webDev_${c} webDev_${c}
   done

   for c in {11..20}
   do
      mkdir -p /home/Documents/delta/alphaq/webDev/webDev3rdyears/webDev_${c}
      sudo useradd -g webDev3rdyears -G webDev3rd4thyears,webDev,alphaq webDev_${c}
      sudo usermod -m -d /home/Documents/delta/alphaq/webDev/webDev3rdyears/webDev_${c} webDev_${c}
   done

   for c in {21..30}
   do
      mkdir -p /home/Documents/delta/alphaq/webDev/webDev4thyears/webDev_${c}
      sudo useradd -g webDev4thyears -G webDev3rd4thyears,webDev,alphaq webDev_${c}
      sudo usermod -m -d /home/Documents/delta/alphaq/webDev/webDev4thyears/webDev_${c} webDev_${c}
   done



   #adding appDev stuff
   mkdir -p /home/Documents/delta/alphaq/appDev/appDev2ndyears
   mkdir -p /home/Documents/delta/alphaq/appDev/appDev3rdyears
   mkdir -p /home/Documents/delta/alphaq/appDev/appDev4thyears


   groupadd appDev2ndyears
   groupadd appDev3rdyears
   groupadd appDev4thyears
   groupadd appDev3rd4thyears
   groupadd appDev



   for c in {01..10}
   do
      mkdir -p /home/Documents/delta/alphaq/appDev/appDev2ndyears/appDev_${c}
      sudo useradd -g appDev2ndyears -G appDev,alphaq,2ndyears appDev_${c}
      sudo usermod -m -d /home/Documents/delta/alphaq/appDev/appDev2ndyears/appDev_${c} appDev_${c}
   done

   for c in {11..20}
   do
      mkdir -p /home/Documents/delta/alphaq/appDev/appDev3rdyears/appDev_${c}
      sudo useradd -g appDev3rdyears -G appDev3rd4thyears,appDev,alphaq appDev_${c}
      sudo usermod -m -d /home/Documents/delta/alphaq/appDev/appDev3rdyears/appDev_${c} appDev_${c}
   done

   for c in {21..30}
   do
      mkdir -p /home/Documents/delta/alphaq/appDev/appDev4thyears/appDev_${c}
      sudo useradd -g appDev4thyears -G appDev3rd4thyears,appDev,alphaq appDev_${c}
      sudo usermod -m -d /home/Documents/delta/alphaq/appDev/appDev4thyears/appDev_${c} appDev_${c}
   done


   #adding sysAd stuff
   mkdir -p /home/Documents/delta/alphaq/sysAd/sysAd2ndyears
   mkdir -p /home/Documents/delta/alphaq/sysAd/sysAd3rdyears
   mkdir -p /home/Documents/delta/alphaq/sysAd/sysAd4thyears


   groupadd sysAd2ndyears
   groupadd sysAd3rdyears
   groupadd sysAd4thyears
   groupadd sysAd3rd4thyears
   groupadd sysAd



   for c in {01..10}
   do
      mkdir -p /home/Documents/delta/alphaq/sysAd/sysAd2ndyears/sysAd_${c}
      sudo useradd -g sysAd2ndyears -G sysAd,alphaq,2ndyears sysAd_${c}
      sudo usermod -m -d /home/Documents/delta/alphaq/sysAd/sysAd2ndyears/sysAd_${c} sysAd_${c}
   done


   for c in {11..20}
   do
      mkdir -p /home/Documents/delta/alphaq/sysAd/sysAd3rdyears/sysAd_${c}
      sudo useradd -g sysAd3rdyears -G sysAd3rd4thyears,sysAd,alphaq sysAd_${c}
      sudo usermod -m -d /home/Documents/delta/alphaq/sysAd/sysAd3rdyears/sysAd_${c} sysAd_${c}
   done


   for c in {21..30}
   do
      mkdir -p /home/Documents/delta/alphaq/sysAd/sysAd4thyears/sysAd_${c}
      sudo useradd -g sysAd4thyears -G sysAd3rd4thyears,sysAd,alphaq sysAd_${c}
      sudo usermod -m -d /home/Documents/delta/alphaq/sysAd/sysAd4thyears/sysAd_${c} sysAd_${c}
   done
fi

sudo usermod -m -d /home/Documents/delta/alphaq/jay_jay -G sudo,alphaq,webDev,webDev3rd4thyears,webDev4thyears,appDev,appDev3rd4thyears,appDev4thyears,sysAd,sysAd4thyears,sysAd3rd4thyears jay_jay
echo "jay_jay:jayjaydabest" | chpasswd

echo "Done with Genuser.sh"