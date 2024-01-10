# Start Hugo Server
* Change Directory to Hugo Repository
`cd repos/`{{exec}}

* Make HUGO Url
`URL=\`sed -e 's/PORT/443/' /etc/killercoda/host\``{{exec}}

* Start Hugo Server
`hugo server --port 443 --bind 0.0.0.0 --baseURL=$URL`{{exec}}

[ACCESS HUGO]({{TRAFFIC_HOST1_443}})
