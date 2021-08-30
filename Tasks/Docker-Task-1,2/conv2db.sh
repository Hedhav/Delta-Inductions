# Script to convert all MoM text files into a mysql database

# MoMs must have date on first line and content on 2nd line. Enter (\n) causes it to become a new field

dates=()

while IFS=' ' read -r username comma datemeet timing 
do  
 
   if [ "${dates[-1]}" != "${datemeet::-1}" ]
   then
      dates+=("${datemeet::-1}")
   fi

done < /home/Documents/delta/alphaq/jay_jay/attendance.txt


while IFS= read -r line || [[ "$line" ]]; do  #collect meeting dates
  dates+=("$line")
done </home/Documents/delta/alphaq/jay_jay/tempfiles/date.txt

for ((i=0; i<${#dates[@]}; i++))
do 
  direc=$(find /home/Documents/delta/alphaq -name ${dates[i]}_MoM)  #find directory of MoM
  if [ "$direc" ]
  then 
    sudo mysql --local_infile=1 -uroot -prootpsswrd alphaq -e "LOAD DATA LOCAL INFILE '$direc' INTO TABLE MoMs FIELDS TERMINATED BY '\n'"
  fi
done  #add file into table

echo "Done with conv2db.sh"