#!/bin/bash
source ./show.sh

displayTable(){
    while true
    do
        # echo "existing tables :"
        # echo $(ls ./databases/"$1")
        # echo "======================="
        # showTables $dbName
        echo "Enter Table Name To Display "
        read tableName
        if [[ $tableName == '' ]]
        then
            echo "Table Name Can't Be Empty"
            displayTable
        elif [[ ! -d ./databases/$dbName/$tableName ]]
        then
            # clear
            echo ""
            echo "Table Doesn't Exist, Choose Another Name"
            displayTable
        else
            #bug car ./databases//dbname/tablename/tablename_desc no such file or dir
            clear
            
            echo "1 - Diplay Table $tableName Description"
            echo "2 - Diplay Table $tableName Data"
            read answer
            
            case $answer in
                1)
                    
                    # libreoffice ./databases/$dbName/$tableName/$tableName"_"desc
                    clear
                    cat ./databases/$dbName/$tableName/$tableName"_"desc
                    break
                ;;
                2)
                    
                    # libreoffice ./databases/$dbName/$tableName/$tableName"_"data
                    clear
                    cat ./databases/$dbName/$tableName/$tableName"_"data
                    break
                ;;
                *)
                    echo "Not Valid Option"
            esac
        fi
    done
}