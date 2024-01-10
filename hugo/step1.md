# Start Hugo Server
* Change Directory to Hugo Repository

`cd repos/`{{exec}}

* Make HUGO Url

`sed -e 's/^/hugo server --port 443 --bind 0.0.0.0 --baseURL=/' -e 's/PORT/443/' /etc/killercoda/host > startHugo.sh`{{exec}}

* Start Hugo Server

`sh startHugo.sh`{{exec}}

[ACCESS HUGO]({{TRAFFIC_HOST1_443}})
