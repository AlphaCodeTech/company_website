from django.db import models
from django.urls import reverse
from django.contrib.auth.models import User

# Create your models here.
class Profile(models.Model):
    user = models.OneToOneField(User, null=True, on_delete=models.CASCADE)
    about = models.TextField()
    company = models.CharField(max_length=255, default="Infomattic Technology")
    job = models.CharField(max_length= 255)
    country = models.CharField(max_length=244)
    address =   models.CharField(max_length=255)
    phone_number = models.CharField(max_length=20)
    profile_pic = models.ImageField(null=True, blank = True, upload_to = "profile/")
    linkedin_url = models.CharField(max_length=255, null=True, blank = True)
    facebook_url = models.CharField(max_length=255, null=True, blank = True)
    twitter_url = models.CharField(max_length=255, null=True, blank = True)
    instagram_url = models.CharField(max_length=255, null=True, blank = True)

    def __str__(self):
        return str(self.user)

    def get_absolute_url(self):
        return reverse('dashboard')
