#!/bin/bash
# define
LOG='/var/log/background.log'

# main
echo "Background Started" >> ${LOG}
apt-get update

# Install venv
apt-get install python3-venv -y

# Create venv
python3 -m venv ~/venv
source ~/venv/bin/activate

# Install LangChain
pip install langchain langchain-community
# openai qdrant-client sentence-transformers tiktoken

# Install Docker
apt-get install ca-certificates curl -y
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# qraud
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

# Finished
echo "Background Done" >> ${LOG}
touch /tmp/background-finished
