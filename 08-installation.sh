#!/bin/bash

USERID=$( id -u )

if [ $USERID -ne 0 ]; then
  echo "Please switch to the Super User"
  exit 1
else
  echo "You are super user, please proceed.."
fi

dnf install nginx -y

if [ $? -ne 0 ]; then
   echo "Installtion of nginx...Failure"
else
   echo "Installation of nginx...Success"
fi