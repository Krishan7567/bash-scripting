#!/bin/bash

set -e

component=frontend

source components/common.sh

echo -n "Installing Nginx:"
yum install nginx -y &>> LOGFILE
stat

echo -n "Downloading the component:"
curl -s -L -o /tmp/$component.zip "https://github.com/stans-robot-project/$component/archive/main.zip"
stat

echo -n "Performing cleanup:"
cd /usr/share/nginx/html
rm -rf *
stat

echo -n "Unzipping the $components:"
unzip /tmp/$component.zip &>> LOGFILE
mv $component-main/* .
mv static/* .
rm -rf $component-main README.md
stat

echo -n "Configuring the reverse proxy:"
mv localhost.conf /etc/nginx/default.d/roboshop.conf
stat

echo -n "Starting frontend services:"
systemctl enable nginx &>> LOGFILE
systemctl start nginx &>> LOGFILE
stat