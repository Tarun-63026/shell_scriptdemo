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
  echo -e "$R Please switch to the super user $N"
  exit 1
else
  echo "You are super user, please proceed.."
fi 

dnf install mysql-server -y
VALIDATE $? "Installation of mysql"

systemctl enable mysqld
VALIDATE $? "Enable the mysql server"

systemctl start mysqld
VALIDATE $? "Starting the mysql server"




