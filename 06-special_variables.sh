#!/bin/bash


echo "all variables: $@"
echo "No of variables: $#"
echo "Script name : $0"
echo "Present working directory : $PWD"
echo "Which user running the script: $USER"
echo "HOSTNAME: $HOSTNAME"
echo "PID of the current process: $$"
sleep 60 &
echo "PID of the last background process: $!"