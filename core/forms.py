from django import forms
from .models import Client

class ClientForm(forms.ModelForm):
    class Meta:
        model = Client
        fields = ('name', 'organization_type','address', 'service_rendered')
