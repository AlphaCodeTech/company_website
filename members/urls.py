from django.urls import path
from . import views
from django.contrib.auth import views as auth_views

urlpatterns= [
    path('register/', views.registerpage, name="register"),
    path('manage-team/', views.Manage_Team.as_view(), name="manage-team"),
    path('<int:id>/member-delete', views.member_delete,name='member-delete'),
    path('<int:pk>/profile', views.ShowProfilePageView.as_view(), name='show_profile_page'),
    path('create_profile_page/', views.CreateProfilePageView.as_view(), name='create_profile_page'),
    path('<int:pk>/edit_profile_page', views.EditProfilePageView.as_view(), name='edit_profile_page'),
    path('password/', views.PasswordsChangeView.as_view(template_name='registration/change-password.html'), name="change-password"),
    path('password_success/', views.Password_Success, name='password_success'),

]
