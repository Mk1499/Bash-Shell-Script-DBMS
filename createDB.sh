#!/bin/bash
source ./useDB.sh

createDB(){
    
    read -p "enter database name : " dbName
    clear
    if [[ ! $dbName =~ ^[0-9a-zA-Z]*$ ]]
    then
        echo "Sorry but this is not a valid database name"
        createDB
    elif [[ $dbName =~ [/\//ig] ]]
    then
        echo "forward slash"
        createDB
    else
        if [ -d ./databases/$dbName ]
        then
            echo "this name is already exists please try again"
            createDB
        else
            if [[ $dbName =~ ^[0-9] ]]
            then
                echo "DB name Must Start With Charachter"
                createDB
            else
                mkdir ./databases/$dbName
                echo "$dbName database is created successfully"
                echo "========================================="
                useDB $dbName
            fi
        fi
    fi
}
