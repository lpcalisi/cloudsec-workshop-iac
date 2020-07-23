
# First Steps: Importing existing resources in Terraform.

Permite importar recursos ya existentes a nuestro estado de Terraform para poder modificarlos.

Cada resource tiene instrucciones de como debe ser importado, al final de cada doc de terraform. Por ejemplo, para importar una <a href="https://www.terraform.io/docs/providers/aws/r/instance.html">AWS EC2 Instance</a>.

Para poder importar un recurso, previamente debemos definirlo en nuestro modulo principal, es decir, si queremos importar el instance i-1234 deberiamos hacer algo como esto.

````hcl
resource "aws_instance" "web" {}
````
Una vez definido el recurso, podemos importarlo

```console
foo$bar:~$ terraform import aws_instance.web i-1234
```

Para finalizar, una vez importado el recurso podemos ver todas sus propiedades buscandolo dentro de nuestro terraform state, pero debemos agregar en el codigo todas las propiedades necesarias para poder modificar el recurso.


<image src="https://github.com/lpcalisi/cloudsec-workshop-iac/blob/master/terraform/6_importing_existing_resources/images/import_workflow.png">
