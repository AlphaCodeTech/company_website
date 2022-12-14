from django.shortcuts import render,get_object_or_404
from django.views import generic
from .forms import SignUpForm, ProfilePageForm, EditProfilePageForm,PasswordChangingForm
from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse_lazy, reverse
from django.contrib.auth.models import User
from .models import Profile
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
from django.contrib.auth.views import PasswordChangeView


# Create your views here.
class UserRegisterView(LoginRequiredMixin, generic.CreateView):
    form_class = SignUpForm
    template_name = 'registration/register.html'
    success_url = reverse_lazy('manage-team')

class Manage_Team(LoginRequiredMixin, generic.ListView):
    model = User
    template_name = 'registration/manage-team.html'

def member_delete(request, id):
    member = User.objects.get(id=id)
    member.delete()
    return HttpResponseRedirect(reverse('manage-team'))

class ShowProfilePageView(generic.DetailView):
    model = Profile
    template_name = 'registration/user_profile.html'

    def get_context_data(self, *args, **kwargs):
        users = Profile.objects.all()
        context = super(ShowProfilePageView, self).get_context_data(*args, **kwargs)

        page_user = get_object_or_404(Profile, id = self.kwargs['pk'])

        context["page_user"] = page_user
        return context

class CreateProfilePageView(generic.CreateView):
    model = Profile
    form_class = ProfilePageForm
    # fields = '__all__'
    template_name = 'registration/create_user_profile_page.html'

    def form_valid(self, form):
        form.instance.user = self.request.user
        return super().form_valid(form)

class EditProfilePageView(generic.UpdateView):
    model = Profile
    form_class = EditProfilePageForm
    template_name = 'registration/edit_profile_page.html'
    success_url = reverse_lazy('dashboard')

class PasswordsChangeView(PasswordChangeView):
    # form_class = PasswordChangeForm
    form_class = PasswordChangingForm
    success_url = reverse_lazy('password_success')

def Password_Success(request):
    return render (request, 'registration/password_success.html', {})
