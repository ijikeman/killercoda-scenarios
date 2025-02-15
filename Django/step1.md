# LangChain Start

## 1. exec venv
```
source ~/venv/bin/activate
```{{exec}}

## 2. make project
```
django-admin startproject myproject
```{{exec}}

## 3. Start Django Server
```
cd myproject
sed -i -e "s/ALLOWED_HOSTS\s\=\s\[\]/ALLOWED_HOSTS\s=\s\[\'\*\'\]/" myproject/settings.py
python manage.py runserver 0.0.0.0:8000
```{{exec}}

## 4. tcp/8000へアクセス
* [ACCESS TO 8000 Top]
({{TRAFFIC_HOST1_8000}})

## 5. DB Migration
```
python manage.py migrate
```{{exec}}

## 6. Creat Admin
```
python manage.py createsuperuser
```{{exec}}

## 7. Access Admin
* [ACCESS TO Admin]({{TRAFFIC_HOST1_8000}})/admin/
