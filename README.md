# Minimal App

Flutter mobile app desarrollada como coding challenge para [coda](https://agencycoda.com/)  

BLoC como Arquitectura y como State Managment.

## Dependencias

La idea fue mantenerlas al mínimo, usé las que realmente creí eran necesarias

Podría haber usado paquetes para mayor customización del UI, por ejemplo: [modal_bottom_sheet](https://pub.dev/packages/modal_bottom_sheet)

#### Comentarios

Decidí manejar la lista de contactos completa como un recurso en la memoria del dispositivo.  

Entiendo que si la lista fuese de un tamaño elevado generaría problemas en la performance de la aplicación.  

Creo que la mejor forma sería mantener un tamaño dinámico de lista a medida que el usuario carga más contactos.  

Para esto, es necesaria una forma de limitar la cantidad de usuarios pedidos al consumir la API.
