#!/bin/bash

# Get the directory of the current file. Three levels up from this
# will be the repos base directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR2="$DIR/../../.."

# Make a link to the alias and environment variables file
HOSTNAME=$(hostname)
case $HOSTNAME in
    (yoshi) 
        echo "Host detected as yoshi. Creating the yoshi repo list"
        find $DIR2 -maxdepth 2 -mindepth 2 -type d | \
            sed "s#$DIR2/##" > "$HOSTNAME"_repos.txt;;
    (luigi) 
        echo "Host detected as luigi. Creating the luigi repo list"
        find $DIR2 -maxdepth 2 -mindepth 2 -type d | \
            sed "s#$DIR2/##" > "$HOSTNAME"_repos.txt;;
    (Glen) 
        echo "Host detected as Glen. Creating the Glen repo list"
        find $DIR2 -maxdepth 2 -mindepth 2 -type d | \
            sed "s#$DIR2/##" > "$HOSTNAME"_repos.txt;;
    (hazza) 
        echo "Host detected as hazza. Creating the hazza repo list"
        find $DIR2 -maxdepth 2 -mindepth 2 -type d | \
            sed "s#$DIR2/##" > "$HOSTNAME"_repos.txt;;
    (*) 
        echo "Warning - Unkown Hostname."  
esac


