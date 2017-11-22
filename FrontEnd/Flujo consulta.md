A continuación se presenta el flujo que sigue una consulta a través de las distintas tecnologías:

![grafiquito](https://user-images.githubusercontent.com/22055735/32150174-152129c0-bcee-11e7-9565-6809c97fa09a.png)

La consulta en primera instancia es recibida por los servicios de vista del front-end construido en base a Django y Materializer, quienes logran conectarse gracias a librería de Django
"django-materialize-css", quienes a través de un POST envían la consulta al back-end, quien por su parte llama a los modelos, de los cuales genera una consulta
en las distintas áreas de Customer, esta es enviada usando el conector psycopg2 a la base de datos en postgresql en el puerto localhost, este revisa la tabla y busca las coincidencias, las
cuales de existir son devueltas posteriormente por el conector psycopg2 el cual genera a través de los modelos un arreglo de las repuestas encontradas, este es llevado al front-end y colocado
en el orden de llegada, por otro lado, si no encuentra coincidencias, presenta un resultado vacio.