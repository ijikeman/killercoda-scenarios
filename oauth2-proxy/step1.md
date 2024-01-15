# Oauth2-proxy Start

## 1. Install oauth2-proxy 
```
VERSION_OAUTH2=2.2.0
VERSION_GO=1.8.1
FILENAME_OAUTH2="oauth2_proxy-${VERSION_OAUTH2}.linux-amd64.go${VERSION_GO}"

wget https://github.com/bitly/oauth2_proxy/releases/download/v`echo ${VERSION_OAUTH2%.*}`/${FILENAME_OAUTH2}.tar.gz -O /tmp/oauth2-proxy.tar.gz

tar zxvf /tmp/oauth2-proxy.tar.gz -C /tmp
mv /tmp/${FILENAME_OAUTH2}/oauth2_proxy /usr/local/bin/
chmod +x /usr/local/bin/oauth2_proxy
```{{exec}}

## 2. Set Service File on Systemd
```
wget https://raw.githubusercontent.com/bitly/oauth2_proxy/v`echo ${VERSION_OAUTH2%.*}`/contrib/oauth2_proxy.service.example -O /usr/lib/systemd/system/oauth2_proxy.service
```{{exec}}

## 3. Set Sample Config File
```
wget https://raw.githubusercontent.com/bitly/oauth2_proxy/v`echo ${VERSION_OAUTH2%.*}`/contrib/oauth2_proxy.cfg.example -O /etc/oauth2_proxy.cfg
```{{exec}}

## 4. Make Cookie Secret by python
```
python -c 'import os,base64; print(base64.urlsafe_b64encode(os.urandom(32)).decode())'
```{{exec}}

### 5. Customize Config File
```
vim /etc/oauth2-proxy.cfg
```{{exec}}

* Custom Configuration File
```

```

### 6. Start oauth2-proxy
```
systemctl start oauth2-proxy
```

### 7. Confirm oauth2-proxy
* [ACCESS TO oauth2-proxy]({{TRAFFIC_HOST1_80}})
