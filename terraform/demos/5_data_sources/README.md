# Using data sources

In this simple example, we will try understand how data sources work getting the most recent ubuntu image for create a EC2 instance.


If we try to execute `terraform plan`, we should see the field `ami` completed by the data source.
```console
➜  5_data_sources git:(master) terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

data.aws_ami.ubuntu: Refreshing state...

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:
```
  ```hcl
  # aws_instance.test will be created
  + resource "aws_instance" "test" {
      + ami                          = "ami-000b3a073fc20e415"
      + arn                          = (known after apply)
      + associate_public_ip_address  = (known after apply)
      + availability_zone            = (known after apply)
      ...
      ...
    }
  ```
```console
Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.

```


