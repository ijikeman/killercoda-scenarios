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

# Install Docker
echo '[Log]: Install docker' >> ${LOG}
apt-get install ca-certificates curl -y
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
echo Y|apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Finished
echo "[Log]: Background Done" >> ${LOG}
touch /tmp/background-finished
