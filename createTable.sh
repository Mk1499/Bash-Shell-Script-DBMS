#!/bin/bash
source ./datatype.sh

nullvalue(){
    echo  "Should $colName Accept null values y/n: "
    read answer
    if [ $answer == 'y' || $answer == 'Y']
    then
        echo -e ":Null" >> ./databases/$dbName/$tableName/$tableName"_"desc
    elif [ $answer == 'n' || $answer == 'N' ]
    then
        echo  -e ":NotNull" >> ./databases/$dbName/$tableName/$tableName"_"desc
        nullvalue
    else
        echo "Not a Valid Option"
        nullvalue
    fi
}

uniquevalue(){
    echo  "Should $colName values be unique y/n: "
    read answer
    if [ $answer -eq 'y' || $answer -eq 'Y']
    then
        echo -e ":unique" >> ./databases/$dbName/$tableName/$tableName"_"desc
    elif [ $answer -eq 'n' || $answer -eq 'N' ]
    then
        echo  -e ":" >> ./databases/$dbName/$tableName/$tableName"_"desc
        nullvalue
    else
        echo "Not a Valid Option"
        uniquevalue
    fi
    
}

CreateTable(){
    echo "Enter Table Name : "
    echo ""
    read tableName
    
    if [[ $tableName == '' ]]
    then
        echo "Table Name Can't Be Empty"
        echo ""
        CreateTable
    elif [[ -d ./databases/$dbName/$tableName ]]
    then
        echo "Table Already Exist"
        echo ""
        CreateTable
    else
        mkdir ./databases/$dbName/$tableName
        touch ./databases/$dbName/$tableName/$tableName"_"desc
        touch ./databases/$dbName/$tableName/$tableName"_"data
        echo "Enter Number Of Columns : "
        echo ""
        read colNum
        # if [[ $colNum -eq 0 ]]
        # then
        
        until [[ $colNum -ne 0 ]]
        do
            echo "Table Should Have at Least One Column"
            echo "Enter Number Of Columns : "
            echo ""
            read colNum
        done
        # fi
        #seq to print number of lines in file according to number of columns
        for i in $(seq $colNum)
        do
            if [[ i -eq 1 ]];
            then
                echo "Enter Primary Key Column Name: "
                read colName
                while [[ colName == '' ]]
                do
                    echo "Column Name Can't Be Empty"
                done
                #-n to remove \n from input
                echo -n $colName >> ./databases/$dbName/$tableName/$tableName"_"desc
                dataType
                #-e to escape backslash
                echo -e ":pk" >> ./databases/$dbName/$tableName/$tableName"_"desc
            else
                echo "enter the name of column $i : "
                read colName
                while [[ colName == '' ]]
                do
                    echo "Column Name Can't Be Empty"
                done
                echo -n $colName >> ./databases/$dbName/$tableName/$tableName"_"desc
                dataType
                echo -e -n ":" >> ./databases/$dbName/$tableName/$tableName"_"desc
                uniquevalue
            fi
        done
        echo ""
        echo "========================================="
        echo "$tableName table is created successfully"
        echo "========================================="
        echo ""
    fi
}
