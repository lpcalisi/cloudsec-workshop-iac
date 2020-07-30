# Modifying resources
Creamos una instancia utilizando terraform que se utiliza para brindar servicios de procesamiento de datos. Luego de un tiempo de tener esta instancia cumpliendo su funcion surgieron algunos problemas y nuevos requerimientos que nos llevan a hacer algunos cambios en la infraestructura.

Tu tarea es hacer el deploy inicial de la infraestructura y luego realizar los cambios necesarios, prestando especial atencion a las acciones que va a realizar terraform ante cada cambio (queremos saber si los cambios van a causar downtime!).

## Etapas
### Crear la infraestructura inicial
Debemos hacer el deploy inicial de la infraestructura. Luego de hacer el deploy no estamos seguros si el espacio que tenemos en el disco sera suficiente para nuestra aplicacion. Necesitamos un disco de al menos 4GB. Como podriamos ver la informacion de la capacidad del disco guardada dentro del estado de terraform?

### Nuevo requerimiento
Nuestro servicio hace uso de datos sensibles, y es importante que le agreguemos un tag a nuestra instancia para indicar que la confidencialidad de la instancia es alta.

Debemos agregar un tag a la instancia con la key `confidentiality` y el valor `high`.

Antes de realizar el cambio con `terraform apply` debemos verificar que este cambio no impacte en la disponibilidad del servicio. Como podriamos hacer eso? Se vera afectada la disponibilidad?

### Cambio de imagen
Necesitamos utilizar un nuevo software que solo se encuentra disponible para Ubuntu 18.04. Debido a esto tenemos que cambiar el filtro de la AMI al valor `ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*`

Que impacto tendra este cambio sobre la disponibilidad del servicio? Perderemos los datos que existen dentro de la instancia al realizar el cambio?
