#!/usr/bin/env bash

#source all modules
for f in ./modules/*.sh; do source $f; done

#module list array
MODULES=(./*)
for ((i=0; i<${#MODULES[@]}; i++)); do
    #do something to each element of array
    MODULES[$i]=`basename ${MODULES[$i]} .sh`
done

function printMenu()
{
    for ((i=0; i<${#MODULES[@]}; i++)); do
        echo i "hello"
        #MODULES[$i]=`basename ${MODULES[$i]} .sh`
    done
}