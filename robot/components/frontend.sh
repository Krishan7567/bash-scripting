#!/bin/bash

set -e

# verify the script is been executed as root user
USERID=$(id -u)

if [ $USERID -ne 0 ] ; then
    echo -e "\e[31m you must run the script as a root user or sudo previledge \e[0m"
    exit 1
fi

echo "Installing Nginx:"
yum install nginx -y &>> /tmp/frontend.log

if [ $? -eq 0 ]; then
    echo -e "\e[32m Success \e[0m"
fi

echo "Downloading the component:"
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"

if [ $? -eq 0 ]; then
    echo -e "\e[32m Success \e[0m"
fi

echo "Performing cleanup:"
cd /usr/share/nginx/html

rm -rf *
unzip /tmp/frontend.zip &>> /tmp/frontend.log
mv frontend-main/* .
mv static/* .
rm -rf frontend-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf

if [ $? -eq 0 ]; then
    echo -e "\e[32m Success \e[0m"
fi

systemctl enable nginx
systemctl start nginx