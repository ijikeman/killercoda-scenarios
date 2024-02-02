
## 7. Make Cookie Secret by python

```
python -c 'import os,base64; print(base64.urlsafe_b64encode(os.urandom(32)).decode())'
```{{exec}}

### 8. Custom Config File

```
cookie_secret = "{Made Cookie Secret Strings}"
```{{copy}}
