checkConstrains(){


    
           colName=$(echo "$j" | cut -d ":" -f 1)
           colDataType=$(echo "$j" | cut -d ":" -f 2)
          thirdfield=$(echo "$j" | cut -d ":" -f 3)
          fourthfield=$(echo "$j" | cut -d ":" -f 4)
         fifthfield=$(echo "$j" | cut -d ":" -f 5)
         sixtfield=$(echo "$j" | cut -d ":" -f 6)


    read -p "enter the new value of $colName" colVal
    if [[ "$colDataType" = number ]]
    then
       if [[ "$colVal" =~ ^[0-9]+$  || "$colVal" =~ ^$ ]]
        then
         checkthirdfield
       else
        echo "invalid for $colName"
        checkConstrains
       fi
    fi

    if [[ "$colDataType" = string ]]
    then
      if [[ "$colVal" =~ ^[a-zA-Z]+ || "$colVal" =~ ^$ ]]
       then
        checkthirdfield
      else
        echo "invalid for $colName"
        checkConstrains
      fi
    fi
    
}

checkthirdfield(){
  flag=1

    if [[ "$thirdfield" = pk ]]
           then
           if [[ "$colVal" != "" ]]
            then
            exists=$(awk 'BEGIN {FS=":"} {print $1}' ./databases/$dbName/$tableName/$tableName'_data')

            if [[ $exists = "" ]]
              then
               if [[ $editFlag != 1 ]]
                then
                      echo -n "$colVal" >> ./databases/$dbName/$tableName/$tableName'_data'
                      echo -n ":" >> ./databases/$dbName/$tableName/$tableName'_data'
                fi
            else
            for i in $exists
            do

              if [ $i == $colVal ]
                then
                 echo "duplicated value ,must be unique"
                 checkConstrains
                 flag=1
                 break
              else
                flag=0
              fi
            done
            if [[ $flag = 0 ]]
              then
               if [[ $editFlag != 1 ]]
                then
               echo -n "$colVal" >> ./databases/$dbName/$tableName/$tableName'_data'
               echo -n ":" >> ./databases/$dbName/$tableName/$tableName'_data'
             fi
            fi



           fi


          else
            echo "error ! must be a not NULL"
            checkConstrains
         fi

    fi


}

insertRecord(){
  
  if [[ $(ls ./databases/"$1" ) == "" ]]
  then 
  echo " Please Create Tables To Insert Record  "
  return 0
  fi

  col=0
  read -p "enter table name : " tableName
  if [ ! -d ./databases/"$1"/$tableName ]
  then
    echo "this name is not exists please try again"
    insertRecord
  else
    editFlag=0
    num= cat ./databases/$dbName/$tableName/$tableName"_"desc | wc -l

    for j in `cat ./databases/$dbName/$tableName/$tableName'_desc' `
    do
     ((col++))
     checkConstrains


    done
     echo -e "" >> ./databases/$dbName/$tableName/$tableName"_"data

  fi
}
