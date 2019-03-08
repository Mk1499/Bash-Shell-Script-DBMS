#!/bin/bash

source ./show.sh
source ./createTable.sh
source ./insert.sh
source ./delete.sh

DBoptions(){
    dbName="$1"
    loop=1
    while [ $loop -eq 1 ]
    do
        
        echo "===================="
        echo "1-show tables"
        echo "2-create new table"
        echo "3-update table"
        echo "4-delete table "
        echo "5-insert record"
        echo "6-delete record"
        echo "00-back"
        
        
        read -p "enter your choice: " choice
        
        case $choice in
            1)
                showTables $dbName
            ;;
            
            2)
                CreateTable $dbName
            ;;
            
            3)
                alterTable
            ;;
            
            4)
                dropTable $dbName
            ;;
            
            
            5)
                showTables $dbName
                insertRecord $dbName
            ;;
            
            
            6)
                showTables $dbName
                editrecord $dbName
            ;;
            
            00)
                loop=0
                clear
            ;;
            
            *)
                echo wrong entry
            ;;
        esac
    done
    
}
