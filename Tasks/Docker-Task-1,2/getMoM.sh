dates=()

while IFS=' ' read -r username comma datemeet timing 
do  
 
   if [ "${dates[-1]}" != "${datemeet::-1}" ]
   then
      dates+=("${datemeet::-1}")
   fi

done < /home/Documents/delta/alphaq/jay_jay/attendance.txt


for ((i=0; i<${#dates[@]}; i++))
do 
    direc=$(find /home/Documents/delta/alphaq -name ${dates[i]}_MoM)  #find directory of MoM
    if [ "$direc" ]
    then
        echo "${dates[i]}" >>/home/Documents/delta/alphaq/jay_jay/MoMs.txt
        echo -n 'MoM taker: ' >>/home/Documents/delta/alphaq/jay_jay/MoMs.txt
        echo $(stat -c "%U" $direc) >>/home/Documents/delta/alphaq/jay_jay/MoMs.txt
        cat $direc >>/home/Documents/delta/alphaq/jay_jay/MoMs.txt
        echo $'\n\n' >>/home/Documents/delta/alphaq/jay_jay/MoMs.txt
    fi
done

echo "Done with getMoM.sh"
