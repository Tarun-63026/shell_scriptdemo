#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log


VALIDATE(){
   if [ $1 -ne 0 ]; then
     echo "$2...Failure"
   else
     echo "$2...Success"
   fi
}


if [ $USERID -ne 0 ]; then
  echo "Please seitch to the super user"
  exit 1
else
  echo "You are super user, please proceed.."
fi 

for i in $@
do
  echo "Pacakge need to install: $i"
  dnf list installed -y $i &>>LOGFILE
  if [ $i -eq 0 ]; then
    echo "Package $i already installed..Skipping"
   else
    dnf install $i -y &>>LOGFILE
    VALIDATE $? "Intallation of $i"
   fi
done