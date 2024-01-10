# Start Hugo Server
```
cd repos/
URL=`sed -e 's/PORT/443/' /etc/killercoda/host`
hugo server --port 443 --bind 0.0.0.0 --baseURL=$URL
```{{exec}}

* [ACCESS HUGO HTTPS]({{TRAFFIC_HOST1_443}})
