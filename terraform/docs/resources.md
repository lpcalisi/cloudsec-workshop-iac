# Resources

Terraform resources are the componentes that we can created, update or modify.

* For define resources, we need to had provider defined
  * Provider should be initialized `terraform init`
 
* Resource definition syntax
  * You can`t use the same name for the same resource type
```hcl
    resource "resource_type" "resource_name" {
        property = value
        property = value
        ...
    }
```
* Each resource will have many available properties, you could use it as input of other resources or deploy's output.

   e.g:
    
     Reference security group id to EC2 Instance
     ```hcl
     resource "aws_instance" "test" {
       ami             = var.AMIS[var.AWS_REGION]
       instance_type   = "t2.micro"
       subnet_id       = var.VPCS[var.AWS_REGION]["SUBNET"]
       key_name        = aws_key_pair.test_key.key_name
       security_groups = [aws_security_group.test-ssh-connection.id]

       tags = {
         "team"    = "cloudsec"
         "project" = "workshop-iac"
       }
     }
     ```
     
     Output public ip from EC2 instance. This variable will be available in `terraform output`
     ```hcl
      output "external_ip" {
       value = "${aws_instance.test.public_ip}"
     }
     ```

You can view resource example and relations beetween it in <a href="https://github.com/lpcalisi/cloudsec-workshop-iac/tree/master/terraform/2_instance_with_sg">demo 2</a>

### Other usefull operations with resources
* terraform [plan, apply, destroy] for a specific resource
```console
foo$bar:~$ terraform plan -target=aws_s3_bucket.example
```

* terraform taint address
Mark resource as tainted means that it will be destroyed and created again at the next apply. 
```console
foo$bar:~$ terraform taint aws_security_group.test-ssh-connection
Resource instance aws_security_group.test-ssh-connection has been marked as tainted.
```

* terraform untaint address
Undo taint
```console
foo$bar:~$ terraform untaint aws_security_group.test-ssh-connection
Resource instance aws_security_group.test-ssh-connection has been successfully untainted.
```


For more docs &rarr; <a href="https://www.terraform.io/docs/configuration/resources.html"> Terraform Resources </a>
