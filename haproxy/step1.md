# HAProxy Start

## 
## 1. Install oauth2-proxy
* haproxyとnginx
```
mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.org
cp ./haproxy.cfg.sample /etc/haproxy/haproxy.cfg
```{{exec}}

### 5. Start haproxy & nginx
* 動作確認の為に、haproxyを起動します
```
systemctl enable --now nginx
systemctl enable --now haproxy
```{{exec}}

### 6. Confirm oauth2-proxy
* tcp/8080へアクセスし、nginx画面が表示されることを確認します
* [ACCESS TO haproxy]({{TRAFFIC_HOST1_8080}})
