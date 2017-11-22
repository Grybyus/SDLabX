# SDLabAp
**OBSERVACIÓN: VER README DESDE EDITOR DE TEXTO / TEXTO NO SE VE DE IGUAL MANERA EN GIT**

Este proyecto corresponde a la primera entrega evaluada para el laboratorio de Sistemas Distribuidos 2-2017, que tiene por objetivo implementar una sencilla herramienta
de búsqueda con las herramientas mostradas en la primera presentación.

Requisitos:
- Ubuntu(Mate o 17.10)
- python 2.7
- virtualenv 15.1.0
- Django 1.11.2
- django-materialize-css 0.0.1
- postgresql 9.5.9
- psycopg2 2.7.1

(asumimos instalado Python, pip y Virtualenv)

Instalación de Herramientas:
- Iniciar un entorno virtual nuevo con Python 2.7 y su pip respectivo
- Django: Para la instalación de Django se utiliza el comando "sudo pip install Django==1.11.2".
- Psycopg2: Corresponde a la herramienta para interconectar Django con Postgresql, para su instalación se utiliza el comando "sudo pip install psycopg2".
- PostgreSQL: Corresponde al gestor de base de datos utilizado, para su instalación se utiliza el comando "sudo apt-get install postgresql".
- django-materialize-css: Materialize corresponde a un framework para front-end que está basado en Material Design creado por Google, django-materialize-css
  es una herramienta que nos permite conectar Django con Materialize, para su instalación se utiliza el comando "sudo pip install django-materialize-css".

Instalación y Configuración de BD:
- Se recomienda colocar los comandos en el directorio Data dentro del proyecto que es donde se encuentran los scripts sql, tdo con el fin de no presentar problemas con el directorio.
- Primero a través de la consola se ingresa a PostgreSQL a travez del comando "psql -U postgres -h localhost -W".
- Ahora dentro de PostgreSQL, se ejecuta la instrucción para crear un usuario "CREATE USER <<Ingrese nombre de usuario aquí>> PASSWORD <<Ingrese su pass>>;".
- Luego para otorgarle los permisos adecuados se le asigna como super-usuario a través del comando "ALTER ROLE <<Ingrese nombre de usuario>> WITH SUPERUSER;".
- A continuación se crea la base de datos "distribuidos" a través del comando "CREATE DATABASE distribuidos WITH OWNER <<Ingrese nombre de usuario>>;".
- Posteriormente se le otorgan los permisos necesarios al usuario a través del comando "GRANT ALL PRIVILEGES ON DATABASE distribuidos TO <<Ingrese nombre de usuario>>;".
- Ahora se puede presionar la combinación de teclas "Ctrl + Z" para salir de PostgreSQL en la consola, o sencillamente cerrar la consola y abrir otra nueva.
- Luego para crear la estructura de la base de datos, es decir, las tablas y su estructura se ejecuta el comando para ejecutar el script dentro del directorio Data
  "psql -h localhost -d distribuidos -U <<USUARIO DE SU BD>> -p 5432 -a -f crearTablas.sql".
- Posteriormente se ingresa una versión simplicada de la base de datos original que tenía un peso aproximado de 2 GB, por una de aproximadamente de 10 mb con la
  ejecución del script "insertarDatosDefinitivo.sql" a través del comando "psql -h localhost -d distribuidos -U <<USUARIO DE SU BD>> -p 5432 -a -f insertarDatosDefinitivo.sql".
- Ahora en el directorio SDin y dentro del archivo settings.py, en el apartado DATABASES, se debe modificar los atributos 'USER' y 'PASSWORD' por los creados anteriormente, de tal forma
  que ahora Django a través de estas credenciales pueda conectarse a la base de datos creada.
  Archivo original:
  ![Archivo setting.py sin modificar](https://user-images.githubusercontent.com/22055735/32140838-ab69ec06-bc4d-11e7-8081-92587d4af3a0.PNG)
  Modificacion a realizar:
  ![Modificaciones necesarias a settings.py](https://user-images.githubusercontent.com/22055735/32140837-ab4aa03a-bc4d-11e7-90ca-1dbde997c5a7.PNG)
- Finalmente en la consola, moviendo al directorio principal del proyecto se debe ejecutar el archivo "manage.py", para lo cual se ejecuta el comando "python manage.py runserver", se esta
  manera la aplicación quedara levantada la dirección del localhost en el puerto 8000, "http://127.0.0.1:8000/".

Detalles:
* Se utilizo el LOCALHOST para la BD
* La aplicación desde el Frontend donde se realiza la consulta, y se envía al Backend el cual termina por consultar a la Base de datos comunicándose por el conector psycopg2 y así entregar este resultado hasta el Frontend
* La separación entre Frontend y Backend no se puede percibir tan claramente debido a cómo trabaja Django como Framework, pero idealmente se separaría usando 2 aplicaciones de Django una con el FrontEnd y otra con el Backend, el Frontend realizaría consultas utilizando el middleware de csrf al Backend, por lo que aumentaría considerablemente la seguridad entre el servidor Frontend y Backend al mismo tiempo que previene ataques de host autónomos que intenten realizar consultas.
