from django.shortcuts import redirect, render,get_object_or_404
from django.views import generic
from .forms import SignUpForm, ProfilePageForm, EditProfilePageForm,PasswordChangingForm
from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse_lazy, reverse
from django.contrib.auth.models import User
from .models import Profile
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
from django.contrib.auth.views import PasswordChangeView
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import Group
from core.decorators import allowed_users


# Create your views here.
@login_required
@allowed_users(allowed_roles=['admin',])
def registerpage(request):
    form = SignUpForm()
    if request.method == "POST":
        form = SignUpForm(request.POST)
        if form.is_valid():
            user = form.save()
            username = form.cleaned_data.get('username')

            return redirect('manage-team')

    context = {'form':form}
    return render(request, 'registration/register.html', context)


class Manage_Team(LoginRequiredMixin, generic.ListView):
    model = User
    template_name = 'registration/manage-team.html'

@login_required
@allowed_users(allowed_roles=['admin',])
def member_delete(request, id):
    member = User.objects.get(id=id)
    member.delete()
    return HttpResponseRedirect(reverse('manage-team'))

class ShowProfilePageView(generic.DetailView, LoginRequiredMixin):
    model = Profile
    template_name = 'registration/user_profile.html'

    def get_context_data(self, *args, **kwargs):
        users = Profile.objects.all()
        context = super(ShowProfilePageView, self).get_context_data(*args, **kwargs)

        page_user = get_object_or_404(Profile, id = self.kwargs['pk'])

        context["page_user"] = page_user
        return context

class CreateProfilePageView(generic.CreateView, LoginRequiredMixin):
    model = Profile
    form_class = ProfilePageForm
    # fields = '__all__'
    template_name = 'registration/create_user_profile_page.html'

    def form_valid(self, form):
        form.instance.user = self.request.user
        return super().form_valid(form)

class EditProfilePageView(generic.UpdateView, LoginRequiredMixin):
    model = Profile
    form_class = EditProfilePageForm
    template_name = 'registration/edit_profile_page.html'
    success_url = reverse_lazy('dashboard')

class PasswordsChangeView(PasswordChangeView, LoginRequiredMixin):
    # form_class = PasswordChangeForm
    form_class = PasswordChangingForm
    success_url = reverse_lazy('password_success')

@login_required
def Password_Success(request):
    return render (request, 'registration/password_success.html', {})
