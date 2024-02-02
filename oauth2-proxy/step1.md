# Oauth2-proxy Start

## oauth2-proxyの起動確認
* Step1ではデフォルトの設定のまま、oauth2-proxyの起動を行い画面が表示されるまでを確

## 1. Install oauth2-proxy
* oauth2-proxyを環境にインストールします
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
* 次にsystemdで起動できるようにoauth2-proxy.servceファイルを設置します
```
wget https://raw.githubusercontent.com/bitly/oauth2_proxy/v`echo ${VERSION_OAUTH2%.*}`/contrib/oauth2_proxy.service.example -O /usr/lib/systemd/system/oauth2_proxy.service
```{{exec}}

## 3. Set Sample Config File
* 公式リポジトリより設定ファイルのサンプルを設置します
```
wget https://raw.githubusercontent.com/bitly/oauth2_proxy/v`echo ${VERSION_OAUTH2%.*}`/contrib/oauth2_proxy.cfg.example -O /etc/oauth2_proxy.cfg
```{{exec}}

### 4. Customize Config File
* 動作確認に必要な起動に最低限の項目のみ仮の内容で修正します
```
vim /etc/oauth2_proxy.cfg
```{{exec}}

* 以下の内容に修正します
```
http_address = "0.0.0.0:4180" # グローバルIPでアクセスする為、Listenアドレスに0.0.0.0を指定

upstreams = [
    "http://127.0.0.1:8080/"
]

# デフォルト
email_domains = [
    "yourcompany.com"
]

client_id = "123456.apps.googleusercontent.com" # デフォルト
client_secret = "test" # 仮設定

cookie_secret = "test" # 仮設定
```{{copy}}

### 5. Start oauth2-proxy
* 動作確認の為に、oauth2-proxyを起動します
```
systemctl start oauth2_proxy
```{{exec}}

### 6. Confirm oauth2-proxy
* tcp/4180へアクセスし、oauth2-proxy画面が表示されることを確認します
* [ACCESS TO oauth2-proxy]({{TRAFFIC_HOST1_4180}})
