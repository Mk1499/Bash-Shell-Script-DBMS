#!/bin/bash
source ./options.sh

useDB(){
  echo "Hello"
  if [ ! -z "$1" ]
  then
  echo "You Databse is : $1"
  # showDB
  # read -p "enter the database you want to use : " dbName
  # if [ ! -d ./databases/$dbName ]
  # then
  #   echo "not a valid existing database name please try again "
  #   useDB
  # else
   options
  fi
 # fi

}
