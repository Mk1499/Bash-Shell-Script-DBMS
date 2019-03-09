
showDB(){
    echo "======================="
    echo "existing databases :"
    echo $(ls ./databases)
    echo "======================="
}

showTables(){
    echo "======================="
    if [[ $(ls ./databases/"$1" ) == "" ]]
    then
        clear
        echo " There is no Tables "
        
    else
        clear
        echo "existing tables :"
        echo $(ls ./databases/"$1")
        echo "======================="
    fi
}
