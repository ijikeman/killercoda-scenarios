# Search Project Start

## 1. make project
```
cd ~
django-admin startproject search
cd search
```{{exec}}

## 2. Start Django Server
```
sed -i -e "s/ALLOWED_HOSTS\s*=\s*\[\]/ALLOWED_HOSTS = \[\'\*\'\]/" myproject/settings.py
```{{exec}}

## 3. Create Code
* search/models.py 
```
from django.db import models

class Item(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()

    def __str__(self):
        return self.name
```

* search/forms.py
```
from django import forms

class SearchForm(forms.Form):
    query = forms.CharField(label="検索", max_length=100)
```

* View search/vies.py
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
```

* search/urls.py
```
from django.urls import path
from .views import search_view

urlpatterns = [
    path('', search_view, name='search'),
]
```

* search/templates/search/search.html
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
```

## 3. DB Migration

```

```{{exec}}

## 6. Creat Admin User
```
python manage.py createsuperuser
```{{exec}}

* 指示にしたがってユーザ作成

## 7. Access Admin
```
python manage.py runserver 0.0.0.0:8000
```{{exec}}

* 作成したユーザでログイン
[ACCESS TO Admin]({{TRAFFIC_HOST1_8000}}admin/)
