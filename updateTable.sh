#!/bin/bash
source ./insert.sh

updateTableData(){

 if [[ $(ls ./databases/$dbName ) == "" ]]
    then
        echo " Please Create Tables To Update  "
        return 0
    fi
    showTables $dbName

read -p "enter table name : " tableName
 if [ ! -d ./databases/$dbName/$tableName ]
 then
    echo "this name is not exists please try again"
   else
   echo "Table Data : "
   echo "================================"
   cat ./databases/$dbName/$tableName/$tableName"_"data
   pkColName=$( cat ./databases/$dbName/$tableName/$tableName"_"desc | awk 'BEGIN{FS=":"}NR==1{print $1}' )
    read -p "Enter $pkColName of col you want to Edit: " pk
  #   echo "======================"
  #   echo "Tables Cols "
  #   echo "=========================="
  #   tail -n +2 ./databases/$dbName/$tableName/$tableName"_"desc | awk 'BEGIN{FS=":"}{print $1}'
  #
  #  read -p "Enter Table Col You Want To Edit : " colName
  #
  #  field=$(sed -n "/^$colName:.*/p" ./databases/$dbName/$tableName/$tableName"_"desc)
  #
  # if [[ $field == "" ]]
  # then
  # echo "Sorry but This is Wrong Col Name"
  # else
  #  feildNo=$(grep -n $colName ./databases/$dbName/$tableName/$tableName"_"desc | awk 'BEGIN{FS=":"}{print $1}')
  #
  #  echo "NO :  $feildNo "
  #
  #  fieldToEdit=$(sed -n "/^$pk:.*/p" ./databases/$dbName/$tableName/$tableName"_"data)
  #  echo "Feild To Edit $fieldToEdit"
newRecord=""

for l in `cat ./databases/$dbName/$tableName/$tableName"_desc"`
   # sed -i "s/^$pk:.*/"Hello"/" ./databases/pe/l/l_data
   do
  echo $l
  name=$(echo "$l" | cut -d ":" -f 1)
  read -p "Enter value of col $name " newVal
  newRecord="${newRecord}$newVal:"
  done
echo "Finally : $newRecord"
sed -i "s/^$pk:.*/$newRecord/" ./databases/$dbName/$tableName/$tableName"_"data
fi

}
