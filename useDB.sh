#!/bin/bash
source ./options.sh
source ./show.sh

useDB(){
  if [ ! -z "$1" ]
 
  then
  echo " Selected Database : $1"
  DBoptions "$1"
 
 else
  showDB
  read -p "enter the database you want to use : " dbName
  clear
  if [ ! -d ./databases/$dbName ] || [ -z $dbName ]
  then
    echo "not a valid existing database name please try again "
    useDB
  else
   echo "Selected Database is : $dbName "
   DBoptions $dbName
  fi
 fi


}
