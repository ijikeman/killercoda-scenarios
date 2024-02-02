#!/bin/bash
# define
LOG='/var/log/background.log'

# main
echo "Background Started" >> ${LOG}

apt-get update
apt-get install haproxy nginx -y

# Finished
echo "Background Done" >> ${LOG}
touch /tmp/background-finished
