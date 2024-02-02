# HAProxy Start

## 
## 1. Install oauth2-proxy
* haproxyとnginx
```
mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.org
```{{exec}}

* make nginx contents
```
echo 'nginx' >> /var/www/html/index.html
```{{exec}}

* haproxy.cfg作成
```
vi /etc/haproxy/haproxy.cfg
```{{exec}}

```
global
    daemon
    maxconn 256

defaults
    mode http

listen http-in
    bind *:8080
    server server1 127.0.0.1:80 maxconn 32
```{{copy}}

### 5. Start haproxy & nginx
* 動作確認の為に、haproxyを起動します
```
systemctl enable --now nginx
systemctl enable --now haproxy
```{{exec}}

### 6. Confirm oauth2-proxy
* tcp/8080へアクセスし、nginx画面が表示されることを確認します
* [ACCESS TO haproxy]({{TRAFFIC_HOST1_8080}})
