#!/bin/bash

USERID=$(id -u)
TIME_STAMP=$(date +F%-H%-M%-S%)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE=/tmp/$SCRIPT_NAME-$TIME_STAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
   if [ $1 -ne 0 ]; then
     echo -e "$2... $R Failure $N"
     exit
   else
     echo -e "$2... $G Success $N" 
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
    echo -e "$i was already installed... $Y Skipping $N"
  else
     dnf install $i -y &>>LOGFILE
     VALIDATE $? "Instlattion of $i"
  fi 
done