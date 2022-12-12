from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse
# Create your models here.

class Client(models.Model):
    """ Database Model for Clients """
    user = models.OneToOneField(User, on_delete=models.SET_NULL, null=True, blank=True)
    name = models.CharField(max_length = 255)
    organization_type = models.CharField(max_length=255)
    address = models.CharField(max_length=255)
    service_rendered = models.CharField(max_length=255)
    date_added = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('home')
