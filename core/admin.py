from django.contrib import admin
from .models import Client, Service, Products,Transaction
# Register your models here.

admin.site.register(Client)
admin.site.register(Service)
admin.site.register(Products)
admin.site.register(Transaction)
