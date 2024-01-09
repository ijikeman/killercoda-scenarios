#!/bin/bash
# define
LOG='/var/log/background.log'

# main
echo "Background Started" >> ${LOG}

# Update Repository
apt update

# Install Hugo
snap install hugo

# Clone My Hugo Repository
git clone https://github.com/ijikeman/ijikeman.github.io.git ./repos/

# Downloads Hugo Theme
cd ./repos/
git submodule update -i

# Finished
echo 'done' > /tmp/background-finished
echo "Done"
