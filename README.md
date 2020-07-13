# What is IAC
Nowadays, most of the users create their infrastructure resources manually, it generates some problems when you want to replicate or modify the infrastructure, having the chance to enter errors or not knowing exactly wich resources form parts of it.
The infrastructure as a code let us define all of our infraestructure resources and configurations in an automated way, versioned and controlled.

# Why should we use IAC?
   * It is auditable, easy to visualize its resources based on code definition.
   * It is versioned, being a code, we can upload it to github and keep our control versions.
   * It is replicable, easy to replicate in other environments.
   * It is updated, we can ask for its current status of our resources in order to validate if its have been modified.
   * It decreases human error, even though we can introduce bugs through the code, before applying the changes we will see which infrastructure components and properties will be modified.


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

