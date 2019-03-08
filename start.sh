#!/bin/bash
source ./useDB.sh
source ./createDB.sh
source ./myFun.sh

if [[ ! -d ./databases ]]
  then
mkdir ./databases
fi
fun

while true
do
echo "========================"
echo "1-create new database"
echo "2-use database"
echo "3-drop datbase"
echo "0-exit"

read -p "enter your choice: " choice

case $choice in
1)
  createDB
  ;;

2)
  if [[ $(ls ./databases ) != "" ]]
    then
  useDB
else
  echo "there is no databases"
fi
  ;;
3)
dropDB
;;

0)
  break
  ;;

*)
  echo wrong entry
  ;;
esac
done

# createDB
