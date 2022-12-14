from django.urls import path
from . import views
urlpatterns = [
    path('', views.home, name="home"),
    path('dashboard/', views.DashboardView.as_view(), name="dashboard"),
    path('client/', views.client, name="client"),
    path('fetch/', views.load_client_data, name = 'load_data'),
    path('manage-client/', views.ClientView.as_view(), name='manage_client'),
    path('<int:id>/edit/', views.client_edit,name='client_edit'),
    path('<int:id>/delete', views.client_delete,name='client_delete'),


]
