#!/bin/bash

set -e

# verify the script is been executed as root user
USERID=$(id -u)
component=frontend

if [ $USERID -ne 0 ] ; then
    echo -e "\e[31m you must run the script as a root user or sudo previledge \e[0m"
    exit 1
fi

stat() {
    if [ $? -eq 0 ]; then
        echo -e "\e[32m Success \e[0m"
    else
        echo -e "\e[31m Failure \e[0m"
    fi    
}

echo -n "Installing Nginx:"
yum install nginx -y &>> /tmp/$component.log
stat

echo -n "Downloading the $component:"
curl -s -L -o /tmp/$component.zip "https://github.com/stans-robot-project/$component/archive/main.zip"
stat

echo -n "Performing cleanup:"
cd /usr/share/nginx/html
rm -rf *
stat

echo -n "Unzipping the $components:"
unzip /tmp/$component.zip &>> /tmp/$component.log
mv $component-main/* .
mv static/* .
rm -rf $component-main README.md
stat

echo -n "Configuring the reverse proxy:"
mv localhost.conf /etc/nginx/default.d/roboshop.conf
stat

echo -n "Starting $component services:"
systemctl enable nginx &>> /tmp/$component.log
systemctl start nginx &>> /tmp/$component.log
stat