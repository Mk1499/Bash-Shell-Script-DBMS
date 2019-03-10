#!/bin/bash
source ./show.sh

displayTable(){
    while true
    do
        
        # echo "existing tables :"
        # echo $(ls ./databases/"$1")
        # echo "======================="
        echo "Enter Table Name To Display "
        read tableName
        if [[ $tableName == / ]]
        then
            showTables $dbName
            echo "/ is not a Table Name"
            displayTable
        elif [[ $tableName == '' ]]
        then
            showTables $dbName
            echo "Table Name Can't Be Empty"
            displayTable
        elif [[ ! -d ./databases/$dbName/$tableName ]]
        then
            showTables $dbName
            echo "Table Doesn't Exist, Choose Another Name"
            displayTable
        else
            clear
            
            echo "1 - Diplay Table $tableName Description"
            echo "2 - Diplay Table $tableName Data"
            read answer
            
            case $answer in
                1)
                    
                    # libreoffice ./databases/$dbName/$tableName/$tableName"_"desc
                    clear
                    cat ./databases/$dbName/$tableName/$tableName"_"desc
                    echo ""
                    break
                ;;
                2)
                    
                    # libreoffice ./databases/$dbName/$tableName/$tableName"_"data
                    clear
                    cat ./databases/$dbName/$tableName/$tableName"_"data
                    echo ""
                    break
                ;;
                *)
                    echo "Not Valid Option"
            esac
        fi
        break
    done
    # echo "existing tables :"
    # echo $(ls ./databases/"$1")
    # echo "======================="
}