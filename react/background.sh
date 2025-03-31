#!/bin/bash
# define
LOG='/var/log/background.log'

# main
echo "[Log]: Background Started" >> ${LOG}
apt update

# Install kotlin
echo "[Log]: Install Nodejs" >> ${LOG}
apt -y install curl
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
apt update
apt -y install nodejs

# Install gradle
echo "[Log]: Install react" >> ${LOG}
npm install react -y

# Finished
echo "[Log]: Background Done" >> ${LOG}
touch /tmp/background-finished
