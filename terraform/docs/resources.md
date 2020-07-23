# Resources

Terraform resources are the componentes that we can created, update or modify.

* For define resources, we need to had provider defined
  * Provider should be initialized `terraform init
* Resource definition syntax
  * You can`t use the same name for the same resource type
````
    resource "resource_type" "resource_name" {
        property = value
        property = value
        ...
    }
````
* Each resource will have many available properties, you could use it as input of other resources or deploy's output.

    Example output public ip from EC2 instance. This variable will be available in `terraform output`
    ````
     output "external_ip" {
      value = "${aws_instance.test.public_ip}"
    }
    ````

You can view resource example and relations beetween it in <a href="https://github.com/lpcalisi/cloudsec-workshop-iac/tree/master/terraform/2_instance_with_sg">demo 2</a>

### Other usefull operations with resources
* terraform [plan, apply, destroy] for a specific resource
````
terraform plan -target=aws_s3_bucket.example
````



