#!/bin/bash

options(){

 loop=1
    while [ $loop -eq 1 ]
    do
    echo "===================="
    echo "1-show tables"
    echo "2-create new table"
    echo "3-update table"
    echo "4-delete table "
    echo "5-insert record"
    echo "6-delete  record"
    echo "00-back"


    read -p "enter your choice: " choice

    case $choice in
    1)
      showTables
      ;;

    2)
      createTable
      ;;

    3)
       alterTable
       ;;

    4)
       showTables
       droptable
        ;;


    5)
      showTables
     insertRecord
     ;;


    6)
      showTables
      editrecord
    ;;

   00)
      loop=0
      ;;

    *)
      echo wrong entry
      ;;
    esac
    done

}