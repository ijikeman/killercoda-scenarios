# Create Extractor

## 1. venv
```
source ~/venv/bin/activate
```{{exec}}

## 2. Create Code
```
git clone https://github.com/ijikeman/Django_PDFScanner.git
```{{exec}}

```
cd Django_PDFScanner
pip install -r requirements.txt
```{{exec}}

* migrate db
```
cd project
python manage.py migrate
```{{exec}}

## 3. Access App
```
python manage.py runserver 0.0.0.0:8000
```{{exec}}

* 作成したユーザでログイン
[ACCESS TO Admin]({{TRAFFIC_HOST1_8000}}/extractor/)
