# Que es IAC
Actualmente, la mayoria de los usuarios crean sus recursos de infraestructura manualmente, y esto genera algunos problemas a la hora de querer replicar la infraestructura o modificarla, con riesgos de introducir errores o de no tener en claro todos los recursos que la componen.
La infraestructura como codigo, nos permite definir todos nuestros recursos de infraestructura y configuraciones de una manera automatizada, versionada y controlada.

# Porque utilizar IAC?
   * Auditable, facilidad para visualizar que recursos componen la infraestructura en base a la definicion del codigo.
   * Versionado, al ser codigo, podemos subirlo a github y mantener nuestro control versiones.
   * Replicable, facil de replicar en otros ambientes.
   * Actualizada, podemos consultar el estado actual de nuestros recursos para validar si sufrieron modificaciones.
   * Menos error humano, si bien podemos introducir fallas a traves del codigo, antes de aplicar los cambios veremos que componentes se modificaran y que propiedades de los mismos.


#### Diferencia entre herramientas de Infrastructure Provisioning y Software Provisioning:
Las herramientas de Infrastructure Provisioning permiten la generacion automatizada de infraestructura a traves de la interaccion con diferentes providers (AWS, GCP, AZURE, etc). Nos permiten crear recursos de diferentes servicios ofrecidos, por ejemplo una instance EC2, un bucket de S3 o una zona DNS de Route53.
En cambio, las herramientas de Software Provisioning se encargan de la configuracion y aprovisionamiento de software en servidores. Por ejemplo, la instalacion y configuracion de un servidor web.

**Herramientas:**
   * Infrastructure Provisioning:
        + Terraform
        + Cloudformation
        + Deploy Manager
   * Software Provisioning:
        + Ansible
        + Puppet
        + Cheff 
        + Saltstack
   * Building Custom Images
        + Packer

Ejemplificando, podriamos crear una instancia EC2 con Terraform y luego, una vez creada, configurarla mediante un playbook ansible.
Otra variante de software provisioning podria ser la creacion de una imagen con todas las configuraciones y software necesario utilizando Packer + Provisioner (ansible, etc) y luego realizar la creacion de una instancia con Terraform que utilice esta imagen.

En este workshop vamos a tratar estos 3 distintos tipos de aprovisionamiento.
  * Infrastructure Provisioning (ej: Terraform)
  * Infrastructure + Software Provisioning (ej: Terraform + Ansible)
  * Build Custom Image + Infrastructure Provisioning (ej: Packer + Terraform).

<br/>
<a href="https://github.com/lpcalisi/cloudsec-workshop-iac/tree/master/terraform">Comenzar con Terraform</a>
<br/>
<a href="https://github.com/lpcalisi/cloudsec-workshop-iac/tree/master/packer">Comenzar con Packer</a>

