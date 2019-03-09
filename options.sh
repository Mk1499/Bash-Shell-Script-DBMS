#!/bin/bash

source ./show.sh
source ./createTable.sh
source ./insert.sh
source ./delete.sh
source ./displayTable.sh

DBoptions(){
    db="$1"
    loop=1
    while [ $loop -eq 1 ]
    do

        echo "Current Database : $db "    
        echo "===================="
        echo "1 - Show Tables"
        echo "2 - Create New Table"
        echo "3 - Update Table"
        echo "4 - Delete Table "
        echo "5 - Insert Record"
        echo "6 - Delete Record"
        echo "7 - Display Table"
        echo "00 - Back"
        
        
        read -p "enter your choice: " choice
        
        case $choice in
            1)
                showTables $db
            ;;
            
            2)
                CreateTable $db
                
            ;;
            
            3)
                alterTable
            ;;
            
            4)
                dropTable $db
            ;;
            
            
            5)
                showTables $db
                insertRecord $db
            ;;
            
            
            6)
                showTables $db
                editrecord $db
            ;;
            
            7)
                showTables $db
                displayTable $db
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
