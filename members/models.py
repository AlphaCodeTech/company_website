from django.db import models
from django.urls import reverse
from django.contrib.auth.models import User

# Create your models here.
class Profile(models.Model):
    user = models.OneToOneField(User, null=True, on_delete=models.CASCADE)
    fullname=models.CharField(max_length=255, null=True, blank=True)
    about = models.TextField(null=True, blank=True)
    company = models.CharField(max_length=255, default="AlphaCode Technology")
    job = models.CharField(max_length= 255, null=True, blank = True)
    country = models.CharField(max_length=244, null=True, blank = True)
    address =   models.CharField(max_length=255, null=True, blank = True)
    phone_number = models.CharField(max_length=20, null=True, blank = True)
    profile_pic = models.ImageField(null=True, blank = True, upload_to = "profile/")
    linkedin_url = models.CharField(max_length=255, null=True, blank = True)
    facebook_url = models.CharField(max_length=255, null=True, blank = True)
    twitter_url = models.CharField(max_length=255, null=True, blank = True)
    instagram_url = models.CharField(max_length=255, null=True, blank = True)

    def __str__(self):
        return str(self.user)

    def get_absolute_url(self):
        return reverse('dashboard')
