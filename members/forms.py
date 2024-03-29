from django.contrib.auth.forms import UserCreationForm, UserChangeForm, PasswordChangeForm
from django.contrib.auth.models import User
from .models import Profile
from django import forms

class ProfilePageForm(forms.ModelForm):

    class Meta:
        model = Profile
        fields = ('about', 'company', 'job', 'country', 'address', 'phone_number', 'profile_pic', 'linkedin_url', 'facebook_url', 'twitter_url', 'instagram_url')

        widgets = {
                'about': forms.Textarea(attrs={'class':'form-control'}),
                # 'profile_pic': forms.TextInput(attrs={'class':'form-control'}),
                'company': forms.TextInput(attrs={'class':'form-control', 'readonly':'True'}),
                'job': forms.TextInput(attrs={'class':'form-control'}),
                'country': forms.TextInput(attrs={'class':'form-control'}),
                'address': forms.TextInput(attrs={'class':'form-control'}),
                'phone_number': forms.TextInput(attrs={'class':'form-control'}),
                'linkedin_url': forms.TextInput(attrs={'class':'form-control'}),
                'facebook_url': forms.TextInput(attrs={'class':'form-control'}),
                'twitter_url': forms.TextInput(attrs={'class':'form-control'}),
                'instagram_url': forms.TextInput(attrs={'class':'form-control'}),
            }

class EditProfilePageForm(forms.ModelForm):

    class Meta:
        model = Profile
        fields = ('fullname', 'about', 'job', 'country', 'address', 'phone_number', 'profile_pic', 'linkedin_url', 'facebook_url', 'twitter_url', 'instagram_url')

        widgets = {
                'fullname': forms.TextInput(attrs={'class':'form-control'}),
                'about': forms.Textarea(attrs={'class':'form-control'}),
                # 'profile_pic': forms.TextInput(attrs={'class':'form-control'}),
                
                'job': forms.TextInput(attrs={'class':'form-control'}),
                'country': forms.TextInput(attrs={'class':'form-control'}),
                'address': forms.TextInput(attrs={'class':'form-control'}),
                'phone_number': forms.TextInput(attrs={'class':'form-control'}),
                'linkedin_url': forms.TextInput(attrs={'class':'form-control'}),
                'facebook_url': forms.TextInput(attrs={'class':'form-control'}),
                'twitter_url': forms.TextInput(attrs={'class':'form-control'}),
                'instagram_url': forms.TextInput(attrs={'class':'form-control'}),
            }

class SignUpForm(UserCreationForm):
    email = forms.EmailField(widget=forms.EmailInput(attrs={'class':'form-control'}))
    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email', 'password1', 'password2')

    def __init__(self, *args, **kwargs):
        super(SignUpForm, self).__init__(*args, **kwargs)

        self.fields['username'].widget.attrs['class'] = 'form-control'
        self.fields['password1'].widget.attrs['class'] = 'form-control'
        self.fields['password2'].widget.attrs['class'] = 'form-control'

class PasswordChangingForm(PasswordChangeForm):
    old_password = forms.CharField(widget=forms.PasswordInput(attrs={'class':'form-control', 'type':'password'}))
    new_password1=forms.CharField(max_length=100, widget=forms.PasswordInput(attrs={'class':'form-control', 'type':'password'}))
    new_password2=forms.CharField(max_length=100, widget= forms.PasswordInput(attrs={'class':'form-control', 'type':'password'}))

    class Meta:
        model = User
        fields = ('old_password', 'new_password1', 'new_password2')
