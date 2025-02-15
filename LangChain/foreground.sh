while [ ! -f /tmp/background-finished ]; do sleep 5; tail -1 /var/log/background.log && echo 'check file'; done
echo Hello and Welcom to this scenario!
