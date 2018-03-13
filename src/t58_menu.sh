#!/bin/bash
# simple script menu

function diskspace {
    clear
    df -k

}

function whoseon {
    clear
    who

}

function memusage {
    clear
    cat /proc/meminfo

}

function print99 {

    for (( i=1; i<=9; i++ ))
    do
        for ((  j=1; j<=i; j++ ))
        do
            echo -e "$i*$j = $[ $i*$j ] \t \c"
        done
        echo ""
    done
}


function menu {
    clear
    echo
    echo -e "\t\t\tSys Admin Menu\n"
    echo -e "\t1. Display disk space"
    echo -e "\t2. Display logged on users"
    echo -e "\t3. Display memory usage"
    echo -e "\tq. Exit program\n\n"
    echo -en "\t\tEnter option: "
    read -n 1 option
}

while [ 1  ]
do
    menu
    case $option in
        q)
            break ;;
        1)
            diskspace ;;
        2)
            whoseon ;;
        3)
            memusage ;;
        *)
            clear
            echo "Sorry, wrong selection";;
    esac
    echo -en "\n\n\t\t\tHit any key to continue"
    read -n 1 line
done
clear


