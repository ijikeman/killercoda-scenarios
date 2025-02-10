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
pip install langchain
# openai qdrant-client sentence-transformers tiktoken

# Finished
echo "Background Done" >> ${LOG}
touch /tmp/background-finished
