

Pasos necesarios para inicializar y levantar la aplicación

Ejecutar en la shell del sistema los siguientes comandos:

1 - $ docker-compose build : crea la imágen necesaria para los containers

2 - $ docker-compose up db : levanta el contenedor MySQL donde se ejecutará el servicio de base de datos de la app

Podemos verificar que el contenedor se construyó correctamente ejecutando (en una nueva instancia de shell)

3 - $ docker-compose run app rake db:setup : con esto se ejecutan las migraciones e inicializamos la base de datos

4 - $ docker-compose run app rake rails s : ejecutamos el servidor de la app

Tenemos acceso a la aplicación desde http://localhost:3001/
