from django.contrib import admin
from .models import (
            Client,
            Service,
            Products,
            Transaction,
            Project,
            Task,
            DailyTaskSubmission)
# Register your models here.

admin.site.register(Client)
admin.site.register(Service)
admin.site.register(Products)
admin.site.register(Transaction)
admin.site.register(Project)
admin.site.register(Task)
admin.site.register(DailyTaskSubmission)
