from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse
from django.utils import timezone
# Create your models here.

# ROLES = (
#     ('React Developer')
# )

TIME_SPENT = (
    ('1 Hour', '1 Hour'),
    ('2 Hours', '2 Hours'),
    ('3 Hours', '3 Hours'),
    ('4 Hours', '4 Hours'),
    ('5 Hours', '5 Hours'),
    ('6 Hours', '6 Hours'),
    ('7 Hours', '7 Hours'),
    ('8 Hours', '8 Hours'),
)
class Service(models.Model):
    name = models.TextField()
    description = models.TextField()
    status = models.CharField(max_length=30, default="active")
    date_added = models.DateTimeField(default=timezone.now)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('dashboard')

class Client(models.Model):
    """ Database Model for Clients """
    user = models.OneToOneField(User, on_delete=models.SET_NULL, null=True, blank=True)
    name = models.CharField(max_length = 255)
    organization_type = models.CharField(max_length=255)
    address = models.CharField(max_length=255)
    service_rendered = models.CharField(max_length=40, default="Web Development")
    date_added = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('dashboard')



class Products(models.Model):
    service_id = models.CharField(max_length=40, default="Web Development")
    name = models.TextField()
    description = models.TextField()
    price = models.FloatField(default=0)
    status = models.CharField(max_length=30, default="active")
    date_added = models.DateTimeField(default=timezone.now)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

class Transaction (models.Model):
    product = models.CharField(max_length=253, default="School Name")
    client_name = models.CharField(max_length=200)
    amount = models.FloatField(default=0)
    payment_method = models.CharField(max_length=200)
    payment_receipt = models.ImageField(null=True, blank=True)
    transaction_id = models.CharField(max_length=200, unique=True)
    transaction_date = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return f"{self.client_name} {self.product}"

    def get_absolute_url(self):
        return reverse('transactions')

    class Meta:
        ordering = ['-transaction_date']

class Project(models.Model):
    assignee = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    project_name = models.CharField(max_length=255)
    description = models.TextField()
    deadline = models.DateField()
    github_repo = models.URLField(max_length=200)
    is_completed = models.BooleanField(default=False, null=True, blank=True)
    is_approved = models.BooleanField(default=False, null=True, blank=True)

    def __str__(self):
        return f"{self.project_name} {self.assignee}"

class Task(models.Model):
    assignee = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    task_name = models.CharField(max_length=255)
    description = models.TextField()
    deadline = models.DateField()
    github_repo = models.URLField(max_length=200)
    is_completed = models.BooleanField(default=False, null=True, blank=True)
    is_approved = models.BooleanField(default=False, null=True, blank=True)

    def __str__(self):
        return f"{self.task_name} {self.assignee}"

class DailyTaskSubmission(models.Model):
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    role = models.CharField(max_length=255)
    email= models.CharField(max_length=255)
    time_spent = models.CharField(max_length= 20, choices=TIME_SPENT)
    date_submitted = models.DateField()
    task_done_on_above_mentioned_date = models.TextField()

    def __str__(self):
        return f"{self.date_submitted} {self.email}"
