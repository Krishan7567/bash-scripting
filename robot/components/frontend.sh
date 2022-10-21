#!/bin/bash

set -e

# verify the script is been executed as root user
USERID=$(id -u)

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
yum install nginx -y &>> /tmp/frontend.log
stat

echo -n "Downloading the component:"
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"
stat

echo -n "Performing cleanup:"
cd /usr/share/nginx/html
rm -rf *
stat

echo -n "Unzipping the components:"
unzip /tmp/frontend.zip &>> /tmp/frontend.log
mv frontend-main/* .
mv static/* .
rm -rf frontend-main README.md
stat

echo -n "Configuring the reverse proxy"
mv localhost.conf /etc/nginx/default.d/roboshop.conf
stat


systemctl enable nginx &>> /tmp/frontend.log
systemctl start nginx &>> /tmp/frontend.log