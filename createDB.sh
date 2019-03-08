#!/bin/bash
source ./useDB.sh

createDB(){

  read -p "enter database name : " dbName
  if [ -d ./databases/$dbName ]
  then
    echo "this name is already exists please try again"
    createDB
  else
    mkdir ./databases/$dbName
    echo "$dbName database is created successfully"
    echo "========================================="
   useDB $dbName
  fi
}
