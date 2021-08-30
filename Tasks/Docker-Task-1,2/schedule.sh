dates=()
times=()


while IFS=' ' read -r futuredate futuretime
do  
  dates+=("$futuredate")
  times+=("$futuretime")
done < /home/Documents/delta/alphaq/jay_jay/future.txt

#CREATION OF FILES with headings only if they dont already exist
if [[ ! -f "/home/Documents/delta/alphaq/sysAd/sysAd4thyears/sysAd_30/schedule.txt" ]]
then
  echo adding\ files
  #adding file for webDev guys
  for c in {01..10}
  do
    touch /home/Documents/delta/alphaq/webDev/webDev2ndyears/webDev_${c}/schedule.txt
    echo "  Date       Time" > /home/Documents/delta/alphaq/webDev/webDev2ndyears/webDev_${c}/schedule.txt
  done


  for (( c=11; c<=20; c++))
  do
    touch /home/Documents/delta/alphaq/webDev/webDev3rdyears/webDev_${c}/schedule.txt
    echo "  Date       Time" > /home/Documents/delta/alphaq/webDev/webDev3rdyears/webDev_${c}/schedule.txt
  done


  for (( c=21; c<=30; c++))
  do
    touch /home/Documents/delta/alphaq/webDev/webDev4thyears/webDev_${c}/schedule.txt
    echo "  Date       Time" > /home/Documents/delta/alphaq/webDev/webDev4thyears/webDev_${c}/schedule.txt
  done




  #adding file for appDev guys
  for c in {01..10}
  do
    touch /home/Documents/delta/alphaq/appDev/appDev2ndyears/appDev_${c}/schedule.txt
    echo "  Date       Time" > /home/Documents/delta/alphaq/appDev/appDev2ndyears/appDev_${c}/schedule.txt
  done


  for (( c=11; c<=20; c++))
  do
    touch /home/Documents/delta/alphaq/appDev/appDev3rdyears/appDev_${c}/schedule.txt
    echo "  Date       Time" > /home/Documents/delta/alphaq/appDev/appDev3rdyears/appDev_${c}/schedule.txt
  done


  for (( c=21; c<=30; c++))
  do
    touch /home/Documents/delta/alphaq/appDev/appDev4thyears/appDev_${c}/schedule.txt
    echo "  Date       Time" > /home/Documents/delta/alphaq/appDev/appDev4thyears/appDev_${c}/schedule.txt
  done




  #adding file for sysAd guys
  for c in {01..10}
  do
    touch /home/Documents/delta/alphaq/sysAd/sysAd2ndyears/sysAd_${c}/schedule.txt
    echo "  Date       Time" > /home/Documents/delta/alphaq/sysAd/sysAd2ndyears/sysAd_${c}/schedule.txt
  done


  for (( c=11; c<=20; c++))
  do
    touch /home/Documents/delta/alphaq/sysAd/sysAd3rdyears/sysAd_${c}/schedule.txt
    echo "  Date       Time" > /home/Documents/delta/alphaq/sysAd/sysAd3rdyears/sysAd_${c}/schedule.txt
  done


  for (( c=21; c<=30; c++))
  do
    touch /home/Documents/delta/alphaq/sysAd/sysAd4thyears/sysAd_${c}/schedule.txt
    echo "  Date       Time" > /home/Documents/delta/alphaq/sysAd/sysAd4thyears/sysAd_${c}/schedule.txt
  done
fi



date=$(date +%Y-%m-%d)


for ((i=0; i<${#dates[@]}; i++))    
do 

  if [ "$date" = "${dates[i]}" ]  #if meeting is on that day
  then
    echo "MEETING TODAY!!!!"

    #editing file for webDev guys
    for c in {01..10}
    do
      echo "${dates[i]} ${times[i]}" >> /home/Documents/delta/alphaq/webDev/webDev2ndyears/webDev_${c}/schedule.txt
    done


    for (( c=11; c<=20; c++))
    do
      echo "${dates[i]} ${times[i]}" >> /home/Documents/delta/alphaq/webDev/webDev3rdyears/webDev_${c}/schedule.txt
    done


    for (( c=21; c<=30; c++))
    do
      echo "${dates[i]} ${times[i]}" >> /home/Documents/delta/alphaq/webDev/webDev4thyears/webDev_${c}/schedule.txt
    done




    #editing file for appDev guys
    for c in {01..10}
    do
      echo "${dates[i]} ${times[i]}" >> /home/Documents/delta/alphaq/appDev/appDev2ndyears/appDev_${c}/schedule.txt
    done


    for (( c=11; c<=20; c++))
    do
      echo "${dates[i]} ${times[i]}" >> /home/Documents/delta/alphaq/appDev/appDev3rdyears/appDev_${c}/schedule.txt
    done


    for (( c=21; c<=30; c++))
    do
      echo "${dates[i]} ${times[i]}" >> /home/Documents/delta/alphaq/appDev/appDev4thyears/appDev_${c}/schedule.txt
    done




    #editing file for sysAd guys
    for c in {01..10}
    do
      echo "${dates[i]} ${times[i]}" >> /home/Documents/delta/alphaq/sysAd/sysAd2ndyears/sysAd_${c}/schedule.txt
    done


    for (( c=11; c<=20; c++))
    do
      echo "${dates[i]} ${times[i]}" >> /home/Documents/delta/alphaq/sysAd/sysAd3rdyears/sysAd_${c}/schedule.txt
    done


    for (( c=21; c<=30; c++))
    do
      echo "${dates[i]} ${times[i]}" >> /home/Documents/delta/alphaq/sysAd/sysAd4thyears/sysAd_${c}/schedule.txt
    done

    break

  fi
done

echo "Done with schedule.sh"