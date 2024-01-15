#!/bin/bash
# define
LOG='/var/log/background.log'

# main
echo "Background Started" >> ${LOG}

# Finished
echo "Background Done" >> ${LOG}
touch /tmp/background-finished
