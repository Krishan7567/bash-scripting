#!/bin/bash

set -e

# verify the script is been executed as root user
USERID=$(id -u)

if [ $USERID -ne 0 ] ; then
    echo -e "\e[31m you must run the script as a root user or sudo previledge \e[0m"
    exit 1
fi


yum install nginx -y

curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"


cd /usr/share/nginx/html

rm -rf *
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf

systemctl enable nginx
systemctl start nginx