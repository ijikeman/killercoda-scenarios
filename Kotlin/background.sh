#!/bin/bash
# define
LOG='/var/log/background.log'

# main
echo "[Log]: Background Started" >> ${LOG}
apt-get update

# Install kotlin
apt-get install openjdk-17-jdk -y
snap info kotlin
snap install kotlin --classic --channel 2.0/stable

# Sample Code Download
echo '[Log]: start Sample Code' >> $LOG
#git clone https://github.com/ijikeman/Killercoda_LangChain_Sample.git
echo '[Log]: end Sample Code' >> $LOG

# Setup Springboot
apt-get install zip unzip -y

# Finished
echo "[Log]: Background Done" >> ${LOG}
touch /tmp/background-finished
