from .models import Transaction
import django_filters

class TransactionFilter(django_filters.FilterSet):
    class Meta:
        model = Transaction
        fields = ['product', 'client_name', 'amount', 'transaction_date', 'payment_method']
