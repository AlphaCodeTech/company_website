from django.shortcuts import render,get_object_or_404
from django.contrib.auth.decorators import login_required
from django.views.generic.base import TemplateView
from django.views import generic
from django.contrib.auth.mixins import LoginRequiredMixin
from django.core import serializers
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
import json
from django.urls import reverse

from .models import Client, Service
from .forms import ClientForm

from django.views.generic import View
# Create your views here.

def home(request):
    return render(request, 'core/index.html', {})

class DashboardView(LoginRequiredMixin,TemplateView):
    template_name='core/dashboard-index.html'

""" Admin Dashboard """
@login_required
def client(request):
    services = Service.objects.filter(status = 1).all()
    return render (request, 'core/client.html',{'services':services})

def load_client_data(request):
    object_list = Client.objects.all()
    json = serializers.serialize('json', object_list)
    return HttpResponse(json, content_type='application/json')

class ClientView(View):
    form_class = ClientForm
    template_name = 'core/client.html'

    def post(self, request):
        form = self.form_class(request.POST)
        data = {'error':form.errors}
        if form.is_valid():
            try:
                name = request.POST.get('name')
                organization_type = request.POST.get('organization_type')
                address = request.POST.get('address')
                service_rendered = request.POST.get('service_rendered')

                obj = get_object_or_404(Client, id=request.POST.get('client_id'))
                obj.name = name
                obj.organization_type = organization_type
                obj.address = address
                obj.service_rendered = service_rendered
                obj.save()
                return JsonResponse({'success':True, 'message':'Client Updated Successfully'})
            except:
                obj = Client(name=request.POST.get('name'), organization_type=request.POST.get('organization_type'), address = request.POST.get('address'), service_rendered=request.POST.get('service_rendered'))
                obj.save()
                return JsonResponse({'success':True, 'message':'Client Created Successfully'})
        else:
            return JsonResponse({'error':True, 'error':form.errors})
        return render(request, self.template_name, {'data':data})

def client_edit(request,id):
    if request.method == 'GET':
        client = Client.objects.filter(id=id).first()

        return JsonResponse({'id':client.id,'name':client.name,'organization_type':client.organization_type,'address':client.address, 'service_rendered':client.service_rendered})
    else:
        return JsonResponse({'errors':'Something went wrong!'})

def client_delete(request,id):
    client = Client.objects.get(id=id)
    client.delete()
    return HttpResponseRedirect(reverse('client'))
