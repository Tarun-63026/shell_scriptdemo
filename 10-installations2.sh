#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%s)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=\tmp\$SCRIPTNAME-$TIMESTAMP.log

VALIDATE(){
    if [ $1 -ne 0 ]; then
      echo "$2...Failure"
    else
      echo "$2...Success"
    fi
}

if [ $USERID -ne 0 ]; then
   echo "Please swicth to the super user"
else
   echo "You are the super user"
fi

dnf install mysql -y &>>LOGFILE
VALIDATE $? "Installtion of Mysql"