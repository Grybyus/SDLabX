# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from SDapp.models import Customer,Region,Nation,Orders,Part,Supplier,Partsupp,Lineitem
from SDapp.serializer import CustomerSerializer
from rest_framework import serializers
import operator
import requests
from rest_framework.parsers import JSONParser
from django.db.models import Q
from django.shortcuts import render_to_response


# Create your views here.
def list_users(request):
	result = search(request)
	return render(request,template_name ='list_users.html',context={'users':result})


def search(request):
    query = request.GET.get('q')
    if query:
        print "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaah"
        r = requests.get('http://127.0.0.1:8080/SDapp/customers/' + query+"/")
        json = r.json()
        print json
        print "xxxxxxxxxxxxx"
    else:
        json = [] 
    return json