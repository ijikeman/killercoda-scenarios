#!/bin/bash
# define
LOG='/var/log/background.log'

# main
echo "[Log]: Background Started" >> ${LOG}
apt update

# Install kotlin
echo "[Log]: Install OpenJDK" >> ${LOG}
apt install openjdk-17-jdk -y

# Install gradle
echo "[Log]: Install gradle" >> ${LOG}
apt install gradle -y

# Install SDKMAN
echo "[Log]: Install SDKMAN" >> ${LOG}
apt install unzip zip -y
curl -s "https://get.sdkman.io" | bash
source "/root/.sdkman/bin/sdkman-init.sh"

# Install kotlin
echo "[Log]: Install kotlin" >> ${LOG}
sdk install kotlin
#snap info kotlin
#snap install kotlin --classic --channel 2.0/stable

# For Setup Springboot
echo "[Log]: Install Packages" >> ${LOG}
apt-get install zip unzip jq -y

# Finished
echo "[Log]: Background Done" >> ${LOG}
touch /tmp/background-finished
