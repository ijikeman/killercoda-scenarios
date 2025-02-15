# Create Search App

## 1. make project
```
python manage.py startapp search
cd search
```{{exec}}

## 2. Create Code
```
vi search/models.py 
```{{exec}}

```
from django.db import models

class Item(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()

    def __str__(self):
        return self.name
```{{copy}}

* migrate db
```
python manage.py makemigrations search
python manage.py migrate
```{{exec}}

## 2. Create Test Data
```
python manage.py shell
```{{exec}}

```
from search.models import Item
Item.objects.create(name="Django", description="A Python web framework")
Item.objects.create(name="Flask", description="A lightweight Python web framework")
exit()
```{{copy}}

## 3. Create Form
```
vi search/forms.py
```{{exec}}

```
from django import forms

class SearchForm(forms.Form):
    query = forms.CharField(label="Search", max_length=100)
```{{copy}}

## 4. Create View
```
vi search/views.py
```{{exec}}

```
from django.shortcuts import render
from .models import Item
from .forms import SearchForm

def search_view(request):
    form = SearchForm(request.GET or None)
    results = None
    if form.is_valid():
        query = form.cleaned_data['query']
        results = Item.objects.filter(name__icontains=query)

    return render(request, "search/search.html", {"form": form, "results": results})
```{{copy}}

## 5. Create Template
* search/templates/search/search.html
```
mkdir -p search/templates/search/
vi search/templates/search/search.html
```{{exec}}

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>検索ページ</title>
</head>
<body>
    <h1>検索ページ</h1>
    <form method="get">
        {{ form.as_p }}
        <button type="submit">検索</button>
    </form>

    {% if results is not None %}
        <h2>検索結果</h2>
        <ul>
            {% for item in results %}
                <li>{{ item.name }}: {{ item.description }}</li>
            {% empty %}
                <li>該当するデータがありません</li>
            {% endfor %}
        </ul>
    {% endif %}
</body>
</html>
```{{copy}}

## 6. Create URL
* search/urls.py(その他はすべてコメントアウト)
```
from django.urls import path
from .views import search_view

urlpatterns = [
    path('', search_view, name='search'),
]
```{{copy}}

## 7. Create URL on projectにも登録
```
vi myproject/urls.py
```{{exec}}

```
from django.contrib import admin
#from django.urls import path
from django.urls import path, include # include Add

urlpatterns = [
    path('admin/', admin.site.urls),
    path('search/', include('search.urls')), # Add
]
```{{copy}}

## 8. search/app.pyに記載されているクラス(SearchConfig)を登録する
```
myproject/settings.py
```{{exec}}

```
INSTALLED_APPS = [
...
    'search.apps.SearchConfig', # Add
]
```{{copy}}

## 9. Access Search App
```
python manage.py runserver 0.0.0.0:8000
```{{exec}}

* 作成したユーザでログイン
[ACCESS TO Admin]({{TRAFFIC_HOST1_8000}}/search/)
