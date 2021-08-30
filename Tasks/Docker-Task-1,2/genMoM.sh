MoMtakers=()
dates=()


while IFS=' ' read -r username comma datemeet timing 
do  

    if [ "${datemeet::-1}" != "$dateloop" ]     #if the date on current line is different from the last 2ndyears' date
    then 

        if [ "${dates[-1]}" != "$dateloop" ] #if the date on current line is different from the array (to avoid repititions)
        then
            MoMtakers+=("$userloop")
            dates+=("$dateloop")
        fi
    fi

    if id -nG "$username" | grep -qw "2ndyears"; then   #store data if its a 2nd year on that line
        dateloop="${datemeet::-1}"
        userloop="${username}"
    fi
    
done < /home/Documents/delta/alphaq/jay_jay/attendance.txt



for ((i=0; i<${#dates[@]}; i++))
do 
    direc=$(awk -F: -v v="${MoMtakers[i]}" '{if ($1==v) print $6}' /etc/passwd) #find home dir of MoMtaker
    touch $direc/${dates[i]}_MoM
    echo "${dates[i]}" >$direc/${dates[i]}_MoM
    echo "${MoMtakers[i]}" >>$direc/${dates[i]}_MoM
    echo "Stuff that happened on ${dates[i]}" >>$direc/${dates[i]}_MoM
    sudo chown ${MoMtakers[i]} $direc/${dates[i]}_MoM    #chnage ownership to MoMtakers, for future usage
done