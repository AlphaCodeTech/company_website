# Generated by Django 4.1 on 2022-12-15 00:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0004_alter_client_service_rendered'),
    ]

    operations = [
        migrations.AlterField(
            model_name='service',
            name='status',
            field=models.CharField(default='active', max_length=30),
        ),
    ]
