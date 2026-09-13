#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%s)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log

VALIDATE(){
    if [ $1 -ne 0 ]; then
      echo "$2...Failure"
    else
      echo "$2...Success"
    fi
}

if [ $USERID -ne 0 ]; then
   echo "Please swicth to the super user"
   exit 1
else
   echo "You are the super user"
fi

for i in $@
do
   echo "Packages needs to install"
   dnf list installed $i -y &>>LOGFILE
   if [ $? -eq 0 ]; then
    echo "$i is already installed...Skipping"
    exit 1
   else
   dnf install $i -y &>>LOGFILE
   VALIDATE $? "Installtion of $i"
   fi
done
