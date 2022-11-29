#!/bin/bash

while getopts p:i:n:h flag
do
    case "$flag" in
        p) basepath=${OPTARG};;
        i) iteration=${OPTARG};;
        h) 
            echo "-p : Pathname under which paths will be created"
            echo "-i : Iteration count for how many paths want to create."
            exit
        ;;
        n) name=${OPTARG};
    esac
done

if [[ $iteration == 0 ]]; then
    echo "iteration cannot be 0"
    exit
fi

if [[ -z $name ]]; then
    name="problem"
fi

for ((i = 0 ; i < $iteration ; i++)); do
    fname=$name$i
    path=$basepath/$fname
    echo "Created path: $path"
    mkdir $path
    cp .main $path/main.c
    cp .rdme $path/README.md
done