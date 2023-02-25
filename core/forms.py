from django import forms
from .models import Client, Service, Products, Transaction, DailyTaskSubmission

payment_choices = [('cash', 'Cash'), ('bank-transfer','Bank Transfer'),  ('online-payment', 'Online Payment')]
payment_method = []

for item in payment_choices:
    payment_method.append(item)

choices = Products.objects.all().values_list('name', 'name')
choice_list =[]

for item in choices:
    choice_list.append (item)


class ClientForm(forms.ModelForm):
    class Meta:
        model = Client
        fields = ('name', 'organization_type','address', 'service_rendered')

class ServiceForm(forms.ModelForm):
    class Meta:
        model = Service
        fields = ('name','description', 'status')

class ProductForm(forms.ModelForm):
    class Meta:
        model = Products
        fields = ('service_id','name', 'description', 'price', 'status')

class TransactionForm(forms.ModelForm):
    class Meta:
        model = Transaction
        fields = ('product', 'client_name', 'amount', 'payment_method', 'payment_receipt', 'transaction_id', 'transaction_date')

        widgets = {
            'product': forms.Select(choices=choice_list, attrs={'class':'form-control'}),
            'client_name': forms.TextInput(attrs={'class':'form-control'}),
            'amount': forms.TextInput(attrs={'class':'form-control'}),
            'payment_method': forms.Select(choices=payment_method, attrs={'class':'form-control'}),

            'transaction_id': forms.TextInput(attrs={'class':'form-control', 'readonly':'True', 'id':'transaction_id'}),
            'transaction_date': forms.TextInput(attrs={'class':'form-control', 'readonly':'True'}),

            # 'author': forms.TextInput(attrs={'class':'form-control', 'value':'', 'id': 'author', 'type':'hidden'}),
        }
class DailyTaskSubmissionForm(forms.ModelForm):
    class Meta:
        model = DailyTaskSubmission
        fields = ('role', 'email', 'time_spent', 'date_submitted', 'task_done_on_above_mentioned_date')

        widgets = {
            'role': forms.Select(choices=choice_list, attrs={'class':'form-control'}),
            'role': forms.TextInput(attrs={'class':'form-control', 'readonly':'True'}),
            'email': forms.TextInput(attrs={'class':'form-control', 'readonly':'True'}),
            # 'time_spent': forms.TextInput(attrs={'class':'form-control'}),
            # 'payment_method': forms.Select(choices=payment_method, attrs={'class':'form-control'}),

            # 'transaction_id': forms.TextInput(attrs={'class':'form-control', 'readonly':'True', 'id':'transaction_id'}),
            # 'transaction_date': forms.TextInput(attrs={'class':'form-control', 'readonly':'True'}),

            # 'author': forms.TextInput(attrs={'class':'form-control', 'value':'', 'id': 'author', 'type':'hidden'}),
        }