#!/bin/bash

set -e

component=mongodb

source components/common.sh

echo -n "Configuring the repo:"
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/stans-robot-project/mongodb/main/mongo.repo


echo -n "Installing Mongodb:"
yum install -y mongodb-org &>> LOGFILE
stat

echo -n "Updating the mongodb conf:"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
stat

echo -n "Downloading the $component schema:"
curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip"
stat


echo -n "Injecting the schema:"
cd /tmp
unzip -o mongodb.zip &>> LOGFILE
cd mongodb-main
mongo < catalogue.js &>> LOGFILE
mongo < users.js &>> LOGFILE
stat


echo -n "Starting mongodb services:"
systemctl enable mongod &>> LOGFILE
systemctl start mongod &>> LOGFILE
stat