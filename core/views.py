from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.views.generic.base import TemplateView
from django.contrib.auth.mixins import LoginRequiredMixin




from django.views import generic
# Create your views here.

def home(request):
    return render(request, 'core/index.html', {})


""" Admin Dashboard """

class DashboardView(LoginRequiredMixin,TemplateView):
    template_name='core/dashboard-index.html'
