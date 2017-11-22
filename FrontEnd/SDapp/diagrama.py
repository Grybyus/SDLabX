# -*- coding: 850 -*-

from eralchemy import render_er
import getpass
import psycopg2
 
salida = False
 
while not salida :
 print 'Entre las credenciales del servidor--->'
 servidor = ("localhost")
 puerto = ("5433")
 basedatos = ("pgguide")
 usuario = ("grybyus")
 contrasena = ('4595')
 try:
 
  cadena = 'postgresql+psycopg2://'+usuario+':'+contrasena+'@'+servidor+':'+puerto+'/'+basedatos
  render_er(cadena, 'salida.png')
  print 'El modelo se encuentra en el archivo salida.png'
  salida=True
 except Exception, e:
  print u'Verifique los parametros de conexión'
  print str(e)