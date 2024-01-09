#!/bin/bash
# define
LOG='/var/log/background.log'

# main
echo "Background Started" >> ${LOG}

# Install Hugo
echo "install hugo" >> ${LOG}
snap install hugo

# Clone My Hugo Repository
echo "clone hugo repository" >> ${LOG}
git clone https://github.com/ijikeman/ijikeman.github.io.git ./repos

# Downloads Hugo Theme
echo "submodule update" >> ${LOG}
cd ./repos
git submodule update -i >> ${LOG}

# Finished
echo 'done' >> /tmp/background-finished
echo "Done"
