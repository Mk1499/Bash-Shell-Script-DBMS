#!/bin/bash
source ./useDB.sh

createDB(){

    read -p "enter database name : " dbName
    clear
    if [[ ! $dbName =~ ^[a-zA-Z]+[a-zA-Z0-9]*$ ]]
    then
        echo "Sorry but this is not a valid database name"
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
