   # Adds users and groups alone (nothing to do with folders, to avoid volume issues)
sudo groupadd alphaq
groupadd head
groupadd 2ndyears

sudo useradd -g head -G alphaq jay_jay

if [[ ! -f "sysAd/sysAd4thyears/sysAd_30" ]]
then


   #adding webDev stuff
   groupadd webDev2ndyears
   groupadd webDev3rdyears
   groupadd webDev4thyears
   groupadd webDev3rd4thyears
   groupadd webDev


   for c in {01..10}
   do
      sudo useradd -g webDev2ndyears -G webDev,alphaq,2ndyears webDev_${c}
   done

   for c in {11..20}
   do
      sudo useradd -g webDev3rdyears -G webDev3rd4thyears,webDev,alphaq webDev_${c}
   done

   for c in {21..30}
   do
      sudo useradd -g webDev4thyears -G webDev3rd4thyears,webDev,alphaq webDev_${c}
   done



   #adding appDev stuff

   groupadd appDev2ndyears
   groupadd appDev3rdyears
   groupadd appDev4thyears
   groupadd appDev3rd4thyears
   groupadd appDev



   for c in {01..10}
   do
      sudo useradd -g appDev2ndyears -G appDev,alphaq,2ndyears appDev_${c}
   done

   for c in {11..20}
   do
      sudo useradd -g appDev3rdyears -G appDev3rd4thyears,appDev,alphaq appDev_${c}
   done

   for c in {21..30}
   do
      sudo useradd -g appDev4thyears -G appDev3rd4thyears,appDev,alphaq appDev_${c}
   done


   #adding sysAd stuff


   groupadd sysAd2ndyears
   groupadd sysAd3rdyears
   groupadd sysAd4thyears
   groupadd sysAd3rd4thyears
   groupadd sysAd



   for c in {01..10}
   do
      sudo useradd -g sysAd2ndyears -G sysAd,alphaq,2ndyears sysAd_${c}
   done


   for c in {11..20}
   do
      sudo useradd -g sysAd3rdyears -G sysAd3rd4thyears,sysAd,alphaq sysAd_${c}
   done


   for c in {21..30}
   do
      sudo useradd -g sysAd4thyears -G sysAd3rd4thyears,sysAd,alphaq sysAd_${c}
   done
fi

sudo usermod -G sudo,alphaq,webDev,webDev3rd4thyears,webDev4thyears,appDev,appDev3rd4thyears,appDev4thyears,sysAd,sysAd4thyears,sysAd3rd4thyears jay_jay

echo "jay_jay:jayjaydabest" | chpasswd

echo "Done with Genuser1.sh"