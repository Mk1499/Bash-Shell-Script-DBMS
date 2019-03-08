#!/bin/bash

dataType(){
    loop = 1
    while (( $loop == 1 ))
    do
        echo "choose the datatype of $colName column ,enter the number of your choice "
        echo "1-datatype is string"
        echo "2-datatype is integer"
        read colType
        case $colType in
            1)
                echo -e -n ":string" >> ./database/$dbName/$tableName/$tableName"_"desc
                loop = 0
            ;;
            2)
                echo -e -n ":integer" >> ./database/$dbName/$tableName/$tableName"_"desc
                loop = 0
            ;;
            *)
                echo "not valid option"
                dataType
            ;;
        esac
    done
} 