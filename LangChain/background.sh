#!/bin/bash
# define
LOG='/var/log/background.log'

# main
echo "[Log]: Background Started" >> ${LOG}
apt-get update

# Install venv
apt-get install python3-venv -y

# Create venv
python3 -m venv ~/venv
source ~/venv/bin/activate

# Install LangChain
echo '[Log]: start Langchain install' >> $LOG
pip install langchain langchain-community langchain-openai sentence-transformers tiktoken
echo '[Log]: end Langchain install' >> $LOG

# Install Docker
echo '[Log]: start docker install' >> $LOG
apt-get install ca-certificates curl -y
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
echo N|apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
echo '[Log]: end docker install' >> $LOG

# qdraud
echo '[Log]: start qdrant install' >> $LOG
cat <<EOF > compose.yml
services:
  qdrant:
    container_name: qdrant
    image: qdrant/qdrant
    volumes:
      - /root/qdrant-data:/qdrant/storage
    ports:
      - 6333:6333
EOF
docker compose up -d
echo '[Log]: end qdrant install' >> $LOG

echo '[Log]: start qdrant client install' >> $LOG
pip install qdrant-client
echo '[Log]: end qdrant client install' >> $LOG

# Sample Code Download
echo '[Log]: start Sample Code' >> $LOG
git clone https://github.com/ijikeman/Killercoda_LangChain_Sample.git
echo '[Log]: end Sample Code' >> $LOG

# Finished
echo "[Log]: Background Done" >> ${LOG}
touch /tmp/background-finished
