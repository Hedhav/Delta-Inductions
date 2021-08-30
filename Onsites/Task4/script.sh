files=()
modtimeold=()
modtimenew=()
declare -i i=0
declare -i j=0      

unset files
unset modtimeold


for entry in login.local/*
do
  files+=("${entry}")
  modtimeold+=($(ls --time-style=+%s%N -l ${entry} | awk "{print(\$6)}"))
  echo "$entry - ${modtimeold[-1]}"
done


# modtimeold+=($(ls -l ${entry} | awk "{print(\$8)}"))



while(true)
do

    unset modtimenew

    for entry in login.local/*
    do
        modtimenew+=($(ls --time-style=+%s%N -l ${entry} | awk "{print(\$6)}"))
    done



    for ((i=0; i<${#files[@]}; i++))
    do 
            
        if [ "${modtimeold[i]}" != "${modtimenew[i]}" ]
        then    

            echo "Change has occured to files - ${files[i]}, and possibly others"
            # # cp login.local Docker/login.local

            cd login.local
            docker-compose build
            docker-compose up -d
            cd ..

                unset modtimeold
                for ((j=0; j<${#files[@]}; j++))
                do 
                    
                    modtimeold+=("${modtimenew[j]}")
                    # modtimeold="$modtimenew"   
                
                done
          break     #if 1 file is changed, docker will handle the replacement of all changed files

            
        fi
        # echo "Everything seems fine for echo "$entry - $modtimeold""
    done





sleep 7s
# echo "Next iteration"

done