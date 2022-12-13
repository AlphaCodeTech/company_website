from django.contrib import admin
from .models import Client, Service, Products
# Register your models here.

admin.site.register(Client)
admin.site.register(Service)
admin.site.register(Products)
