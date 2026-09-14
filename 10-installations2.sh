#!/bin/bash

USERID=$(id -u)
TIME_STAMP=$(date +F%-H%-M%-S%)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE=/tmp/$SCRIPT_NAME-$TIME_STAMP.log

VALIDATE(){
   if [ $1 -ne 0 ]; then
     echo "$2...Failure"
     exit
   else
     echo "$2...Success"
   fi
}


if [ $USERID -ne 0 ]; then
  echo "Please switch to the super user"
  exit 1
else
  echo "You are super user, please proceed.."
fi 

for i in $@
do
  echo "Package to Install: $i"
  dnf list installed $i &>>LOGFILE
  if [ $? -eq 0 ]; then
    echo "$i was already installed"
  else
     dnf install $i -y &>>LOGFILE
     VALIDATE $? "Instlattion of $i"
  fi 
done