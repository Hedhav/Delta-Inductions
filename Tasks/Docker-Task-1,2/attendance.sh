
# to execute function, type:   'bash attendance.sh absentees'   without quotes (obviously)
# with arguments:   'bash attendance.sh absentees <date> <date>' 
# eg. 'bash attendance.sh absentees 2019-09-28 2020-01-13'
# Arguments can be ANY dates between 2019-09-27 and 2020-07-16 (both included)


absentees()
{

rm -f /home/Documents/delta/alphaq/jay_jay/absentees.txt

dates=()

while IFS=' ' read -r username comma datemeet timing 
do  
 
   if [ "${dates[-1]}" != "${datemeet::-1}" ]
   then
      dates+=("${datemeet::-1}")
   fi

done < /home/Documents/delta/alphaq/jay_jay/attendance.txt

# date=$(date +%Y-%m-%d)



# while IFS= read -r line || [[ "$line" ]]; do
#   dates+=("$line")
# done </home/Documents/delta/alphaq/jay_jay/tempfiles/date.txt
# we now have a list of dates as an array


declare -i i=0

# This section of code is pretty much useless, 
# but i spent so long fixing the bugs in it that i dont have the heart to delete it

# days=()
# for ((k=0;k<1000;k++))      
# do
#    if [ "$(date -d "${dates[0]} + $k day" +%Y-%m-%d)" = "${dates[i]}" ]
#    then
#         days[i]=k
#         i+=1

#    fi

#    if [ $i = 50 ]
#     then
#         break
#     fi
# done

datesnew=()

first=0
declare -i last=${#dates[@]}-1



if [ "$1" ]    #IF ARGUMENTS ARE PASSED, OBATAIN RANGE OF INDICES OF NECESSARY ELEMENTS
then 

   unset datesnew

   for ((i=0; i<${#dates[@]}; i++))
   do 
               
      if [[ "${dates[i]}" > "$1" ]]
      then
         first=$i
         break
      fi
   done
   # obtaining indices of dates that correspond to arguments


   for ((i=$first; i<${#dates[@]}; i++))
   do 
            
      if [[ "${dates[i]}" > "$2" ]]
      then  
         last=$((i-1))
         break
      fi
   done
  
fi

declare -i j=0

for ((i=$first; i<=$last; i++))  #transferring necessary dates to new array 
do                               #(regardless of whether arguements are passed or not)
   datesnew[j]=${dates[i]} 
   j+=1
done
     





#IF RECORD ISN'T THERE, IT'LL BE ADDED TO ABSENTEES.TXT

#webDev
for ((i=0; i<${#datesnew[@]}; i++))
do 
   for k in {01..30}
   do
      if !(grep -q webDev_${k}\ \-\ ${datesnew[i]} /home/Documents/delta/alphaq/jay_jay/attendance.txt)
      then
       echo webDev_${k} - ${datesnew[i]} >>/home/Documents/delta/alphaq/jay_jay/absentees.txt
      fi

   done
done

#appDev
for ((i=0; i<${#datesnew[@]}; i++))
do 
   for k in {01..30}
   do
      if !(grep -q appDev_${k}\ \-\ ${datesnew[i]} /home/Documents/delta/alphaq/jay_jay/attendance.txt)
      then
       echo appDev_${k} - ${datesnew[i]} >>/home/Documents/delta/alphaq/jay_jay/absentees.txt
       fi

   done
done


#sysAd
for ((i=0; i<${#datesnew[@]}; i++))
do 
   for k in {01..30}
   do
      if !(grep -q sysAd_${k}\ \-\ ${datesnew[i]} /home/Documents/delta/alphaq/jay_jay/attendance.txt)
      then
       echo sysAd_${k} - ${datesnew[i]} >>/home/Documents/delta/alphaq/jay_jay/absentees.txt
       fi

   done
done
echo "Done with attendance.sh, i.e., there actually were absenteed in that date range"
}



"$@"