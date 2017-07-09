"""notenrollen URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from . import views
from django.shortcuts import redirect

'''
def index_view(request, **args):
    return redirect(views.gen_catalogue, page_count=50, page_index=0)
'''

urlpatterns = [
    url(r'^$', views.index_page, name="index"),
    url(r'^explore$', views.explore, name="explore"),
    url(r'^search$', views.search, name="search"),
    url(r'^player$', views.player, name="player"),

    # url(r'^quiz$', views.quiz, name="quiz"),

    # rest api to ask for search requests:
    url(r'^search_database?(?P<keyword>[a-z]*)$', views.search_database, name="searchdatabase"),

    # url(r'^catalogue/(?P<page_count>[0-9]{1,3})/(?P<page_index>[0-9]{1,4})$', views.gen_catalogue, name="catalogue"),

    # url(r'^$', index_view, name="catalogue"),

    # disable admin site:
    # url(r'^admin/', admin.site.urls),
]
