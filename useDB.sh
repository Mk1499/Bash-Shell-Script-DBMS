#!/bin/bash
source ./options.sh
source ./show.sh

useDB(){
    dbName="$1"
    if [ ! -z $dbName ]
    
    then
        echo " Selected Database : $dbName"
        DBoptions $dbName
        
    else
        showDB
        read -p "Enter The Database Name You Want To Use : " dbName
        clear
        if [ ! -d ./databases/$dbName ]
        then
            echo "Not a Valid Existing Database Name, Please Try Again "
            useDB
        elif [ -z $dbName ]
        then
            echo "Database Can't be Empty "
            useDB
            #error lw e5trt ( * - / - . )as a database name by3mlha use 3ady
        elif [ $dbName == '*' ]
        then
            echo "No Database Exist With This Name "
            useDB
        else
            echo "Selected Database is : $dbName "
            DBoptions $dbName
        fi
    fi
    
    
}
