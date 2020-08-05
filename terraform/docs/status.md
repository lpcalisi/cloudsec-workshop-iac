# State

One of the best qualities of terraform is to keep your infrastructure in a certain state. Terraform states is in charge of keeping track of every change made on our terraform resources. State should represent the current infrastructure deployed. Changing resources without terraform will be not be reflected on the state, you should always modify your infrastructure using terraform, otherwise you might lose your changes.

<p align="center">
  <image src="images/terraformstate.png" align="center" width="50%" height="50%" />
</p>


Terraform has two ways to manage states

#### Local State
 * By default, terraform creates a `terraform.tfstate` file in the root modules's path which holds all the data of your states. Additionally, a second file  `terraform.tfstate.backup` saves the previous state. If you want to define your own terraform state file path, you can do so with the flag `-state=path`
 * Local state is generally used for little sized projects. You could save it in github for version controlling.
 * One disadvantage, it's that we all have to be sure to have the latest version of the state.

#### Remote State
  * Remote states are generally used in medium / large scale projects. Since it always avaiable and updated. Every developer uses the same file which can be hosted in a common place.
  * You need to provide the remote storage manually, it's not posible to create it with terraform within the same project.
  * You need to have access to the remote storage such as AWS S3 or GCS (Google Cloud Storage).

Usually remote states are defined in the `backend.tf`. If not terraform `terraform {}` is defined the state will be stored locally.

 ```hcl
 terraform {
  backend "s3" {
    bucket = "workshop-terraform-cloudsec-states"
    key    = "workshop_status.tf"
    region = "us-east-1"
  }
}
 ```

#### Other usefull operations
To show these operations, we should to use the terraform.tfstate created after having done demo 2.

* #### terraform fmt
Run `terraform fmt` before committing a new change on your terraform files its a good practice to avoid useless differences in version control.

* #### terraform show
Get the list of all resources in the state
````console
foo@bar:~$ terraform state list
aws_instance.test
aws_key_pair.test_key
aws_security_group.test-ssh-connection
````

Show all properties of a resource
```console
foo@bar:~$ terraform state show aws_instance.test
```
```hcl
# aws_instance.test:
resource "aws_instance" "test" {
    ami                          = "ami-0f9c9884b78c1a3f6"
    arn                          = "arn:aws:ec2:us-east-1:123456781234:instance/i-0ebc1j4912cjalco1"
    associate_public_ip_address  = true
    ...
    ...
    ...
}
```
* #### terraform state mv
Rename a resource
```console
foo@bar:~$ terraform state mv aws_instance.test aws_instance.example
Move "aws_instance.test" to "aws_instance.example"
Successfully moved 1 object(s).
```
* #### terraform refresh
For this example, I had modified the resource `aws_security_group.test-ssh-connection` manually adding an ingress rule with the example CIDR `123.123.123.123/32`
###### original security group
```console
foo@bar:~$ terraform state show aws_security_group.test-ssh-connection
```
```hcl
# aws_security_group.test-ssh-connection:
resource "aws_security_group" "test-ssh-connection" {
    ...
    ...
    id                     = "sg-00b218dd65fbabd8c"
    ingress                = [
        {
            cidr_blocks      = [
                "190.210.146.233/32",
            ]
            description      = "SSH from my pc"
            from_port        = 22
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 22
        },
    ]
   ...
   ...
}
```
###### refresh
```console
foo@bar:~$ terraform refresh
aws_key_pair.test_key: Refreshing state... [id=test-workshop-iac-key]
aws_security_group.test-ssh-connection: Refreshing state... [id=sg-00b218dd65fbabd8c]
aws_instance.example: Refreshing state... [id=i-0ebc1j4912cjalco1]
````

###### after refresh
```console
foo@bar:~$ terraform state show aws_security_group.test-ssh-connection
```
```hcl
# aws_security_group.test-ssh-connection:
resource "aws_security_group" "test-ssh-connection" {
    ...
    ...
    id                     = "sg-00b218dd65fbabd8c"
    ingress                = [
        {
            cidr_blocks      = [
                "123.123.123.123/32",
            ]
            description      = "Test Terraform refresh"
            from_port        = 22
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 22
        },
        {
            cidr_blocks      = [
                "200.210.220.110/32",
            ]
            description      = "SSH from my pc"
            from_port        = 22
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 22
        },
    ...
}
```
We could view the resource with the ingress security group added. For backup, terraform will create another backup with the previous state.

* #### terraform import
Import an existing S3 bucket, each resource has it own specification about how must be imported at the end of <a href="https://www.terraform.io/docs/providers/aws/r/s3_bucket.html"> Terraform AWS S3</a>.

Previusly, you need to define empty resource in your terraform statements such as `resource aws_s3_bucket.example {}`

List actual resources
````console
foo@bar:~$ terraform state list
aws_instance.test
aws_key_pair.test_key
aws_security_group.test-ssh-connection
````

Import existing S3 bucket
```console
foo@bar:~$ terraform import aws_s3_bucket.example workshop-terraform-cloudsec-states

aws_s3_bucket.example: Importing from ID "workshop-terraform-cloudsec-states"...
aws_s3_bucket.example: Import prepared!
  Prepared aws_s3_bucket for import
aws_s3_bucket.example: Refreshing state... [id=workshop-terraform-cloudsec-states]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.
````

Now, you have the S3 bucket with all its properties
```console
foo@bar:~$ terraform state list
aws_instance.test
aws_key_pair.test_key
aws_s3_bucket.example
aws_security_group.test-ssh-connection
```


**:warning: IMPORTANT: both `terraform refresh` and `terraform import` update the changes only on the states, but they are not added to your terraform files. If you want that, you should add them by hand using the generated state as a guide.**


For more docs:

 &rarr; <a href="https://www.terraform.io/docs/state/index.html"> Terraform State </a>

 &rarr; <a href="https://www.terraform.io/docs/backends/types/local.html"> Terraform Local </a>

 &rarr; <a href="https://www.terraform.io/docs/backends/types/remote.html"> Terraform Remote </a>
