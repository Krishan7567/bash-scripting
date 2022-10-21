#!/bin/bash

set -e

component=mongodb

source components/common.sh

echo -n "Configuring the repo:"
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/stans-robot-project/mongodb/main/mongo.repo


echo -n "Installing Mongodb:"
yum install -y mongodb-org &>> LOGFILE
stat

echo -n "Starting frontend services:"
systemctl enable mongod &>> LOGFILE
systemctl start mongod &>> LOGFILE
stat