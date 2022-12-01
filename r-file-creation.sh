#!/bin/bash

function get_last() {
    max=0
    for dir in $basepath/*; do
        num=$(echo $dir | tr -dc '0-9')
        if (( num > max )); then
            max=$num
        fi
    done
    echo $max
}

function format_path() {
    lastchar=$(echo "${basepath:(-1)}")
    if [[ $lastchar == "/" ]]; then
        basepath=${basepath::-1}
    fi
}

append=false;
opterr=0
while getopts p:i:n:ha flag
do
    case "$flag" in
        p) basepath=${OPTARG};;
        i) iteration=${OPTARG};;
        h) cat << EOF
Usage: create-template.sh [OPTION]...

-p : Pathname for directory creation
-i : Iteration count for how many paths want to create.
-a : Append -i count of new file
-n : preffered path name. Default value: problem
EOF
exit
        ;;
        n) name=${OPTARG};;
        a) append=true;;
    esac
done

if [[ -z $iteration || -z $basepath ]]; then
    echo "Iteration and Path must be specified. Use -i and -p options."
    exit
fi

if [[ -z $name ]]; then
    name="problem"
fi

format_path

begin=1
if [[ $append == true ]]; then
    max=$(get_last)
    iteration=$((iteration+$max+1))
    begin=$((max+1))
    echo iteration $iteration
    echo begin $begin
else
    iteration=$((iteration+1))
    echo iteration $iteration
fi

for ((i = begin ; i < $iteration ; i++)); do
        fname=$name$i
        path=$basepath/$fname
        echo "Created path: $path"
        mkdir $path
        cp .main $path/main.c
        cp .rdme $path/README.md
done