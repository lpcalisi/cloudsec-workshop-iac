# Modifying resources
Creamos una instancia utilizando terraform que se utiliza para brindar servicios de procesamiento de datos. Luego de un tiempo de tener esta instancia cumpliendo su funcion surgieron algunos problemas y nuevos requerimientos que nos llevan a hacer algunos cambios en la infraestructura.

Tu tarea es hacer el deploy inicial de la infraestructura y luego realizar los cambios necesarios, prestando especial atencion a las acciones que va a realizar terraform ante cada cambio (queremos saber si los cambios van a causar downtime!).

## Etapas
### Crear la infraestructura inicial

### Nuevo requerimiento
Nuestro servicio hace uso de datos sensibles, y es importante que le agreguemos un tag a nuestra instancia para indicar que la confidencialidad de la instancia es alta.

Debemos agregar un tag a la instancia con la key `confidentiality` y el valor `high`.

Antes de realizar el cambio con `terraform apply` debemos verificar que este cambio no impacte en la disponibilidad del servicio. Como podriamos hacer eso? Se vera afectada la disponibilidad?

### Problemas de procesamiento
Nuestra instancia procesa muchos datos, y nos dimos cuenta que la cantidad de CPUs que tiene la instancia es poca. Debemos cambiar el `instance_type` a `t2.medium`.

Que impacto tendra este cambio sobre la disponibilidad del servicio? Perderemos los datos que existen dentro de la instancia al realizar el cambio?

### Problemas de procesamiento (otra vez)
