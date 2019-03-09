#!/bin/bash
source ./show.sh

displayrow(){
    showTables $dbName
    echo "Enter Table Name"
    read tableName
    
    if [[ $tableName == '' ]]
    then
        echo "Table Name Can't Be Empty"
        displayrow
    elif [[ ! -d ./databases/$dbName/$tableName ]]
    then
        clear
        echo "Table Doesn't Exist, Choose Another Name"
        displayrow
    else
        echo "done"
    fi
}