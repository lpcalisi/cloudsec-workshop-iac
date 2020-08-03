# Modules

A *module* is a container for multiple resources that are used together.

* You can use modules to make your configurations more organized.
* Use third party modules
  * Terraform Registry
  * GitHub
  * Bitbucket
  * S3 buckets
  * GCS buckets
  * Import other modules from the community.
* Reuse parts of your code.
  * Create cluster (e.g. one for staging and other for prod).
  * Create alerts (e.g. create similar alerts with one or two parameters of difference).

--- 

## Example

### Defining a basic module
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
}
```

* *module-instance/aws.tf*
```hcl
provider "aws" {
  version = "~> 2.0"
  region  = var.region
}
```


### Invoking the module
You can use the module once:

```hcl
module "ec2_instance" {
  source = "./module-instance"
  image = "ami-0f9c9884b78c1a3f6"
  region = "us-east-1"
  instance_type = "t2.micro"
}
  ```

Or several times:
```hcl
module "ec2_instance_us_east_1" {
  source = "./module-instance"
  image = "ami-0f9c9884b78c1a3f6"
  region = "us-east-1"
  instance_type = "t3.nano"
}

module "ec2_instance_us_east_2" {
  source = "./module-instance"
  image = "ami-0f9c9884b78c1a3f6"
  region = "us-east-2"
  instance_type = "m5dn.xlarge"
}

module "ec2_instance_us_west_1" {
  source = "./module-instance"
  image = "ami-0f9c9884b78c1a3f6"
  region = "us-west-1"
  instance_type = "r3.large"
}
```

### Accessing child modules output values
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


For more docs &rarr; <a href="https://www.terraform.io/docs/configuration/modules.html">Terraform Modules</a>
