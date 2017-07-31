#!/usr/bin/env bash

#source all modules
for f in ./modules/*.sh; do source $f; done

#module list array
MODULES=(./modules/*)
for ((i=0; i<${#MODULES[@]}; i++)); do
    #do something to each element of array
    MODULES[$i]=`basename ${MODULES[$i]} .sh`
done

function printMenu()
{
    echo
    echo
    echo "--------------Module List--------------"
    for ((i=0; i<${#MODULES[@]}; i++)); do
	desc=${MODULES[$i]}_desc
	echo [$i] ${!desc}
    done
    echo
    echo [a] Initialize all modules
    echo [q] Quit
    echo "----------------------------------------"
}

function runModule()
{
    echo $1 
    if [ $1 -ge 0 ] && [ $1 -lt ${#MODULES[@]} ]; then
    	eval ${MODULES[$1]}_init
    fi
}

while true
do
    printMenu
    read -p "Please input module number to start initialize: " module_number
    
    if [ ${module_number} == "q" ]; then
        echo
        echo "exit success"
        break
    else
 	runModule $module_number
    fi
done
