#!/bin/bash
# define
LOG='/var/log/background.log'

# main
echo "Background Started" >> ${LOG}

# Update Repository
apt update

# Clone My Hugo Repository
git clone https://github.com/ijikeman/ijikeman.github.io.git ./repos/

# Build Hugo Image
cd ./repos/
docker-compose up -d

# Finished
echo 'done' > /tmp/background-finished
echo "Done"
