# BrastlewarkCensus
Brastlewark Census for RPG (Kavak Test) :)

## Introducción

En este proyecto se obtine un listado de gnomos que viven en Brastlewark para mejorar
la experiencia de un juego RPG al entrar en el poblado y ver toda su información de cada uno de 
los Gnomos habitantes. Se pueden buscar los nombre especificos de cada Gnomo en la población.  

### Prerequisitos

Este proyecto utiliza el administrador de dependencia Cocoapods para algunas funcionalidades 
por lo que se deberá ejecutar POD install en el proyecto para instalar las librerias.


### Estructura del proyecto

Se explicará el proyecto de forma general sus funciones y estructura. 

```
En este proyecto se utilizo el patrón MVVM para conectar las vistas con los modelos
y separar toda la logica de negocio y no tener viewcontrollers llenos de miles de líneas.

GnomeViewModel se encarga de esto. Este apartir de un inyeccion de dependencias se inicializa pasando una struct de tipo
Gnome. Y aqui se desarrolla cualquier modificacion de la información. Esta después se actualizará directamente en los views en este caso las celdas de la tabla.

Esto facilita el hacer pruebas unitarias de código dado que toda la lógica y transformación de datos se encuentra en el 
ViewModel.

Primero que nada al empezar la aplicación llama al singleton Service que se ha creado para hacer requests 
a diferentes webservices el cuál me devolverá la información en formato JSON. El metódo en especifico llamado es "fetchPopulation", que tiene como parámetro un closure el cuál al recibir una respuesta devolverá los datos ya decodeados apartir del JSON que se recibe en la respuesta.

Una vez obtenida una respuesta satisfactoria esta información se almacenará en un arreglo de tipo GnomeViewModel, el cual se 
pasara en el datasource de la tableview para rellenar los views de la celda.

En el caso especial de las imágenes se utilizo la clase NSCache la cuál funciona como una especie de diccionario donde setteas con un par de llave-valor. Así guardándolas en este caso por su thumbnail_url como su llave para despues si ya fueron bajadas encontrarlas facilmente y settearlas para que no se este llamando de nuevo al metodo de bajar imagen y se esten consumiendo datos de red.

Para evitar bloquear la interfaz se utiliza DispatchQueue.main.async para settear la imagen y hace la tarea en un background thread el cual al terminar actualizara el main thread.

Otra función que se puede encontrar en esta aplicación es la capacidad de buscar Gnomos por nombre en la app a través de un UISearchBar,  la cual tiene delegados que te informan cuando ciertas tareas se estan ejecutando.

Como funcionalidad adcional se agregaron 2 librerias instaladas con cocapods la cual permite animaciones de colores en las celdas y tambien una que permite mostrar una vista de actividad indicando que esta cargando cosas de la red para dar más feedback al usuario.

```

## Cocoapods usados

* [KRProgressHUD](https://github.com/krimpedance/KRProgressHUD) - HUD de progresso para usar en iOS.
* [Pastel](https://maven.apache.org/) - Animación de color en gradientes utilizado en las celdas de la aplicación

## Authors

* **Jorge Luis Manzanarez Gonzalez** - *Test para KAVAK* 

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
