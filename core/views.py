from django.shortcuts import render,get_object_or_404
from django.contrib.auth.decorators import login_required
from django.views.generic.base import TemplateView
from django.views import generic
from django.contrib.auth.mixins import LoginRequiredMixin
from django.core import serializers
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
import json
from django.urls import reverse
from datetime import date, datetime

from .models import (
    Client, 
    Service, 
    Products, 
    Transaction, 
    DailyTaskSubmission,
    Project,
    Task,
)
from .forms import ClientForm, ServiceForm, ProductForm, TransactionForm

from django.views.generic import View, CreateView
from .filters import TransactionFilter

from .mixins import GroupRequiredMixin
from django.contrib import messages
from .decorators import allowed_users
# Create your views here.

def home(request):
    
    return render(request, 'core/index.html' )


@login_required 
def dashboard(request):
    total_project = Project.objects.filter(assignee = request.user).count()
    completed_project = Project.objects.filter(assignee = request.user, is_completed =True).count()
    approved_project = Project.objects.filter(assignee = request.user, is_approved =True).count()

    total_task = Task.objects.filter(assignee = request.user).count()
    completed_task = Task.objects.filter(assignee = request.user, is_completed =True).count()
    approved_task = Task.objects.filter(assignee = request.user, is_approved =True).count()
    context={
        'total_project': total_project,
        'completed_project': completed_project,
        'approved_project': approved_project,
        
        'total_task': total_task,
        'completed_task': completed_task,
        'approved_task': approved_task,
    }
    return render(request, 'core/dashboard-index.html', context)

""" Admin Dashboard """

'''Client Section'''
@login_required
@allowed_users(allowed_roles=['admin',])
def client(request):
    services = Service.objects.filter(status = "active").all()
    return render (request, 'core/client.html',{'services':services})

def load_client_data(request):
    object_list = Client.objects.all()
    json = serializers.serialize('json', object_list)
    return HttpResponse(json, content_type='application/json')

class ClientView(View, LoginRequiredMixin):
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

@login_required
@allowed_users(allowed_roles=['admin',])
def client_edit(request,id):
    if request.method == 'GET':
        client = Client.objects.filter(id=id).first()

        return JsonResponse({'id':client.id,'name':client.name,'organization_type':client.organization_type,'address':client.address, 'service_rendered':client.service_rendered})
    else:
        return JsonResponse({'errors':'Something went wrong!'})

@login_required
@allowed_users(allowed_roles=['admin',])
def client_delete(request,id):
    client = Client.objects.get(id=id)
    client.delete()
    return HttpResponseRedirect(reverse('client'))
'''End Of Service Section'''



'''Service Section'''
@login_required
@allowed_users(allowed_roles=['admin',])
def service(request):
    return render (request, 'core/service.html',{})

def load_service_data(request):
    object_list = Service.objects.all()
    json = serializers.serialize('json', object_list)
    return HttpResponse(json, content_type='application/json')

class ServiceView(View):
    form_class = ServiceForm
    template_name = 'core/service.html'

    def post(self, request):
        form = self.form_class(request.POST)
        data = {'error':form.errors}
        if form.is_valid():
            try:
                name = request.POST.get('name')
                description = request.POST.get('description')
                status = request.POST.get('status')

                obj = get_object_or_404(Service, id=request.POST.get('service_id'))
                obj.name = name
                obj.description = description
                obj.status = status
                obj.save()
                return JsonResponse({'success':True, 'message':'Service Updated Successfully'})
            except:
                obj = Service(name=request.POST.get('name'), description=request.POST.get('description'), status = request.POST.get('status'))
                obj.save()
                return JsonResponse({'success':True, 'message':'Service Created Successfully'})
        else:
            return JsonResponse({'error':True, 'error':form.errors})
        return render(request, self.template_name, {'data':data})

def service_edit(request,id):
    if request.method == 'GET':
        service = Service.objects.filter(id=id).first()

        return JsonResponse({'id':service.id,'name':service.name,'description':service.description,'status':service.status})
    else:
        return JsonResponse({'errors':'Something went wrong!'})

def service_delete(request,id):
    service = Service.objects.get(id=id)
    service.delete()
    return HttpResponseRedirect(reverse('service'))
'''End Of Service Section'''

'''Product Section'''
@login_required
@allowed_users(allowed_roles=['admin',])
def product(request):
    services = Service.objects.filter(status = "active").all()
    return render (request, 'core/product.html',{'services':services})

def load_product_data(request):
    object_list = Products.objects.all()
    json = serializers.serialize('json', object_list)
    return HttpResponse(json, content_type='application/json')

class ProductView(View):
    form_class = ProductForm
    template_name = 'core/product.html'

    def post(self, request):
        form = self.form_class(request.POST)
        data = {'error':form.errors}
        if form.is_valid():
            try:
                service_id = request.POST.get('service_id')
                name = request.POST.get('name')
                description = request.POST.get('description')
                price = request.POST.get('price')
                status = request.POST.get('status')

                obj = get_object_or_404(Products, id=request.POST.get('product_id'))
                obj.service_id = service_id
                obj.name = name
                obj.description = description
                obj.price =price
                obj.status = status
                obj.save()
                return JsonResponse({'success':True, 'message':'Product Updated Successfully'})
            except:
                obj = Products(service_id=request.POST.get('service_id'),name=request.POST.get('name'), description=request.POST.get('description'), price = request.POST.get('price'), status = request.POST.get('status'))
                obj.save()
                return JsonResponse({'success':True, 'message':'Service Created Successfully'})
        else:
            return JsonResponse({'error':True, 'error':form.errors})
        return render(request, self.template_name, {'data':data})

@allowed_users(allowed_roles=['admin',])
def product_edit(request,id):
    if request.method == 'GET':
        product = Products.objects.filter(id=id).first()

        return JsonResponse({'id':product.id,'service_id':product.service_id, 'name':product.name,'description':product.description,'price':product.price,'status':product.status})
    else:
        return JsonResponse({'errors':'Something went wrong!'})

@allowed_users(allowed_roles=['admin',])
def product_delete(request,id):
    product = Products.objects.get(id=id)
    product.delete()
    return HttpResponseRedirect(reverse('product'))
'''End Of Product Section'''

"""Transaction Starts"""
class MakeTransactionView(generic.CreateView, GroupRequiredMixin):
    model = Transaction
    template_name = 'core/make-transaction.html'
    group_required= ['admin',]
    form_class = TransactionForm

@allowed_users(allowed_roles=['admin',])
def receipt(request,id):
    if request.method == 'GET':
        tran = Transaction.objects.filter(id=id).first()

        return JsonResponse({'id':tran.id,'product':tran.product, 'client_name':tran.client_name,'amount':tran.amount,'payment_method':tran.payment_method,'transaction_id':tran.transaction_id, 'transaction_date':tran.transaction_date})
    else:
        return JsonResponse({'errors':'Something went wrong!'})

@login_required
@allowed_users(allowed_roles=['admin',])
def transaction_delete(request, id):
    tran = Transaction.objects.get(id=id)
    tran.delete()
    return HttpResponseRedirect(reverse('transactions'))

@login_required
def transactions(request):
    transaction_list = Transaction.objects.all()
    transaction_filter = TransactionFilter(request.GET, queryset=transaction_list)
    return render(request, 'core/transactions.html', {'filter':transaction_filter})

"""Transaction Ends """
@login_required
@allowed_users(allowed_roles=['admin',])
def account_overview(request):
    now = datetime.now()
    current_year = now.strftime("%Y")
    current_month = now.strftime("%m")
    current_day = now.strftime("%d")
    service = Service.objects.all().count()
    products = Products.objects.all().count()
    customer = Client.objects.all().count()
    transaction_today = Transaction.objects.filter(transaction_date__day = current_day).count()

    revenue_day = Transaction.objects.filter(transaction_date__day = current_day).all()
    revenue_day = sum(revenue_day.values_list('amount', flat=True))

    transaction_month = Transaction.objects.filter(transaction_date__month = current_month).count()

    revenue_month = Transaction.objects.filter(transaction_date__month = current_month).all()
    revenue_month = sum(revenue_month.values_list('amount', flat=True))

    transaction_total = Transaction.objects.count()

    today_sales = Transaction.objects.filter(
        transaction_date__year=current_year,
    ).all()

    total_sales = sum(today_sales.values_list('amount',flat=True))

    transactions_today = Transaction.objects.filter(transaction_date__day = current_day)

    context = {
        'service' : service,
        'products' : products,
        'transaction_today': transaction_today,
        'revenue_day': revenue_day,
        # 'transaction' : transaction,
        'total_sales' : total_sales,
        'customer': customer,
        'transaction_month': transaction_month,
        'revenue_month':revenue_month,
        'transaction_total': transaction_total,
        'transactions_today':transactions_today,
        }
    return render(request, 'core/account-overview.html', context)

@login_required
def daily_task_submission(request):
    if request.method == 'POST':
        user = request.user
        role = request.POST['role']
        email = request.POST['email']
        time_spent = request.POST['time_spent']
        date_submitted = request.POST['date_submitted']
        task_done_on_above_mentioned_date = request.POST['taskdone']
        
        if DailyTaskSubmission.objects.create(user=user,role=role,email=email,time_spent=time_spent,date_submitted=date_submitted, task_done_on_above_mentioned_date = task_done_on_above_mentioned_date):
            messages.success(request, 'Daily Task Submitted Successfully.')
        else:
            messages.error(request, "An Error Occured while submitting task")
    return render(request, 'core/daily_task_submission.html')

@login_required
def tasks(request, pk):
    task = Task.objects.filter(assignee=pk)
    return render(request, 'core/tasks.html', {'tasks':task})

@login_required
def task_detail(request,id):
    if request.method == 'GET':
        proj = Task.objects.filter(id=id).first()

        return JsonResponse({'id':proj.id,'task_name':proj.task_name, 'description':proj.description,'deadline':proj.deadline,'github_repo':proj.github_repo})
    else:
        return JsonResponse({'errors':'Something went wrong!'})
    
@login_required
def task_complete(request, id):
    try:
        obj = get_object_or_404(Task, id=id)
        obj.is_completed = True
        obj.save()
       
        return HttpResponseRedirect(reverse('dashboard'))
    except:
        pass

@login_required
def projects(request, pk):
    projects = Project.objects.filter(assignee=pk)
    return render(request, 'core/projects.html', {'projects':projects})

@login_required
def project_detail(request,id):
    if request.method == 'GET':
        proj = Project.objects.filter(id=id).first()

        return JsonResponse({'id':proj.id,'project_name':proj.project_name, 'description':proj.description,'deadline':proj.deadline,'github_repo':proj.github_repo})
    else:
        return JsonResponse({'errors':'Something went wrong!'})
    
@login_required
def project_complete(request, id):
    try:
        obj = get_object_or_404(Project, id=id)
        obj.is_completed = True
        obj.save()
       
        return HttpResponseRedirect(reverse('dashboard'))
    except:
        pass