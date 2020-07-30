# Modifying resources
Creamos una instancia utilizando terraform que se utiliza para brindar servicios de procesamiento de datos. Luego de un tiempo de tener esta instancia cumpliendo su función surgieron algunos problemas y nuevos requerimientos que nos llevan a hacer algunos cambios en la infraestructura.

Tu tarea es hacer el deploy inicial de la infraestructura y luego realizar los cambios necesarios, prestando especial atención a las acciones que va a realizar terraform ante cada cambio (queremos saber si los cambios van a causar downtime!).

## Crear la infraestructura inicial
Debemos hacer el deploy inicial de la infraestructura. Luego de hacer el deploy no estamos seguros si el espacio que tenemos en el disco sera suficiente para nuestra aplicación. Necesitamos un disco de al menos 4GB. ¿Cómo podemos ver la información de la capacidad del disco guardada dentro del estado de terraformación?

## Nuevo requerimiento
Nuestro servicio hace uso de datos sensibles cuya protección es requerida por distintas regulaciones, y es importante que le agreguemos un tag a nuestra instancia para indicar que la confidencialidad de la instancia es alta.

Debemos agregar un tag a la instancia con la key `Confidentiality` y el valor `Restricted`.

Antes de realizar el cambio con `terraform apply` debemos verificar que este cambio no impacte en la disponibilidad del servicio. ¿Cómo podríamos hacer eso? ¿Se verá afectada la disponibilidad?

## Cambio de imagen
Necesitamos utilizar un nuevo software que solo se encuentra disponible para Ubuntu 18.04. Debido a esto tenemos que cambiar el filtro de la AMI al valor `ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*`

¿Qué impacto tendrá este cambio sobre la disponibilidad del servicio? ¿Perderemos los datos que existen dentro de la instancia al realizar el cambio?
