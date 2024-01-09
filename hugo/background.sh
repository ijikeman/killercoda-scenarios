#!/bin/bash
# define
LOG='/var/log/background.log'

# main
echo "Background Started" >> ${LOG}

# Install Hugo
snap install hugo >> ${LOG}

# Clone My Hugo Repository
git clone https://github.com/ijikeman/ijikeman.github.io.git ./ >> ${LOG}

# Downloads Hugo Theme
cd ./
git submodule update -i >> ${LOG}

# Finished
echo 'done' > /tmp/background-finished
echo "Done"
