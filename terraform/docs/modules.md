# Modules

A *module* is a container for multiple resources that are used together.

* You can use modules to make our configurations more organized.
* Use third party modules
  * Modules from github
  * Import other modules from the community.
* Reuse parts of your code.
  * e.g: create cluster and pass number of desired instances as parameter.

--- 

#### Defining example basic module
* *module-instance/variables.tf*
```hcl
variable image {}
variable region {}
variable instance_type {}
```

* *module-instance/instance.tf*
```hcl
resource "aws_instance" "test" {
  ami             = var.image
  instance_type   = var.instance_type
```

* *module-instance/aws.tf*
```hcl
provider "aws" {
  version = "~> 2.0"
  region  = var.region
}
```

#### Invoking local module

```hcl
module "ec2_instance" {
  source = "./module-instance"
  image = "ami-0f9c9884b78c1a3f6"
  region = "us-east-1"
  instance_type = "t2.micro"
}
  ```
  
#### Accessing child modules output values

The resources defined in a module are encapsulated, so the calling module cannot access their attributes directly. However, the child module can declare output values to selectively export certain values to be accessed by the calling module.

* *module-instance/output.tf*
```hcl
output "public_ip" {
  value = aws_instance.test.public_ip
}
```

* *main.tf*
```hcl
output "instance_public_ip" {
  value = module.ec2_instance.public_ip
}
```


For more docs &rarr; <a href="https://www.terraform.io/docs/configuration/modules.html"/>








