
# to execute function, type:   'bash attendance.sh absentees'   without quotes (obviously)
# with arguments:   'bash attendance.sh absentees <date> <date>' 
# eg. 'bash attendance.sh absentees 2019-09-28 2020-01-13'
# Arguments can be ANY dates between 2019-09-27 and 2020-07-16 (both included)

# bash script2.sh changecol phone 11 12
# bash script2.sh changecol phone 9100692214 asdfasdf
# bash script2.sh changecol employeeId 805347 abcd
changecol()
{

colchange="$1"
oldval="$2"
newval="$3"

echo -n "">newfile.txt


if [ $colchange == "phone" ]
then
    
    while IFS=',' read -r phone employeeId name salaries email year

    do  
    
        if [ "${oldval}" == "${phone}" ]
        then
            echo ""\""$newval"\"","\""$employeeId"\"","\""$name"\"","\""$salaries"\"","\""$email"\"","\""$year"\""">>newfile.txt
        else
            echo ""\""$phone"\"","\""$employeeId"\"","\""$name"\"","\""$salaries"\"","\""$email"\"","\""$year"\""">>newfile.txt
        fi

    done < file.txt

elif [ $colchange == "employeeId" ]
then
    
    while IFS=',' read -r phone employeeId name salaries email year

    do  
    
        if [ "${oldval}" == "${employeeId}" ]
        then
        echo ""\""$phone"\"","\""$newval"\"","\""$name"\"","\""$salaries"\"","\""$email"\"","\""$year"\""">>newfile.txt
            else
                echo ""\""$phone"\"","\""$employeeId"\"","\""$name"\"","\""$salaries"\"","\""$email"\"","\""$year"\""">>newfile.txt
        fi

    done < file.txt

elif [ $colchange == "name" ]
then
    
    while IFS=',' read -r phone employeeId name salaries email year

    do  
    
        if [ "${oldval}" == "${name}" ]
        then
            echo ""\""$phone"\"","\""$employeeId"\"","\""$newval"\"","\""$salaries"\"","\""$email"\"","\""$year"\""">>newfile.txt
        else
            echo ""\""$phone"\"","\""$employeeId"\"","\""$name"\"","\""$salaries"\"","\""$email"\"","\""$year"\""">>newfile.txt
        fi

    done < file.txt

elif [ $colchange == "salaries" ]
then
    
    while IFS=',' read -r phone employeeId name salaries email year

    do  
    
        if [ "${oldval}" == "${salaries}" ]
        then
            echo ""\""$phone"\"","\""$employeeId"\"","\""$name"\"","\""$newval"\"","\""$email"\"","\""$year"\""">>newfile.txt
        else
            echo ""\""$phone"\"","\""$employeeId"\"","\""$name"\"","\""$salaries"\"","\""$email"\"","\""$year"\""">>newfile.txt
        fi

    done < file.txt

elif [ $colchange == "email" ]
then
    
    while IFS=',' read -r phone employeeId name salaries email year

    do  
    
        if [ "${oldval}" == "${email}" ]
        then
            echo ""\""$phone"\"","\""$employeeId"\"","\""$name"\"","\""$salaries"\"","\""$newval"\"","\""$year"\""">>newfile.txt
        else
            echo ""\""$phone"\"","\""$employeeId"\"","\""$name"\"","\""$salaries"\"","\""$email"\"","\""$year"\""">>newfile.txt
        fi

    done < file.txt

elif [ $colchange == "year" ]
then
    
    while IFS=',' read -r phone employeeId name salaries email year

    do  
    
        if [ "${oldval}" == "${year}" ]
        then
            echo ""\""$phone"\"","\""$employeeId"\"","\""$name"\"","\""$salaries"\"","\""$email"\"","\""$newval"\""">>newfile.txt
        else
            echo ""\""$phone"\"","\""$employeeId"\"","\""$name"\"","\""$salaries"\"","\""$email"\"","\""$year"\""">>newfile.txt
        fi

    done < file.txt



fi

# elif [ $colchange employeeId ]
# then
#    Statement(s) to be executed if expression 2 is true
# elif [ $colchange 3 ]
# then
#    Statement(s) to be executed if expression 3 is true
# else
#    Statement(s) to be executed if no expression is true
# fi



# while IFS=',' read -r phone employeeId name salaries email year

# do  
 
#    if [ "${dates[-1]}" != "${datemeet::-1}" ]
#    then
#       dates+=("${datemeet::-1}")
#    fi

# done < file.txt





}


"$@"


