from django.urls import path
from . import views
urlpatterns = [
    path('', views.home, name="home"),
    path('dashboard/', views.DashboardView.as_view(), name="dashboard"),
    path('client/', views.client, name="client"),
    path('fetch-client/', views.load_client_data, name = 'load_client_data'),
    path('manage-client/', views.ClientView.as_view(), name='manage_client'),
    path('<int:id>/edit/', views.client_edit,name='client_edit'),
    path('<int:id>/delete', views.client_delete,name='client_delete'),

    path('service/', views.service, name="service"),
    path('fetch-service/', views.load_service_data, name = 'load_service_data'),
    path('manage-service/', views.ServiceView.as_view(), name='manage_service'),
    path('<int:id>/service-edit/', views.service_edit,name='service_edit'),
    path('<int:id>/service-delete', views.service_delete,name='service_delete'),

    path('product/', views.product, name="product"),
    path('fetch-product/', views.load_product_data, name = 'load_product_data'),
    path('manage-product/', views.ProductView.as_view(), name='manage_product'),
    path('<int:id>/product-edit/', views.product_edit,name='product_edit'),
    path('<int:id>/product-delete', views.product_delete,name='product_delete'),

    path('make-transaction/',views.MakeTransactionView.as_view(), name='make-transaction'),
    path('transactions/', views.transactions, name='transactions'),
    path('<int:id>/receipt/', views.receipt,name='receipt'),
    path('<int:id>/transaction-delete', views.transaction_delete,name='transaction_delete'),

    path('account-overview/', views.account_overview, name='account_overview'),

    path('daily_task_submission/', views.daily_task_submission, name="daily_task_submission"),

]
