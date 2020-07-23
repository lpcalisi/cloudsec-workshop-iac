# Data Sources

Terraform data sources provide you dynamic information for input in your terraform. Terraform provide us data sources for certain providers, you can check availables data sources in each resource type of Terraforms Docs.

ie:
  
   *In the AWS EC2 AMI resource type, you can see two differentes types (<a href="https://www.terraform.io/docs/providers/aws/d/ami.html">DataSource</a> and <a href="https://www.terraform.io/docs/providers/aws/d/ami.html">Resource</a>)*
   
<br>

In order to differenciate DataSources from Resources, a simple example could be:
  
  * Data Source
  
  This statement gets the latest ubuntu 16.04 aws image. After this, terraform will have available properties such as `data.aws_ami.ubuntu.id`
  ```hcl
    data "aws_ami" "ubuntu" {
      most_recent = true

      filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
      }

      filter {
        name   = "virtualization-type"
        values = ["hvm"]
      }

      owners = ["099720109477"] # Canonical
    }
  ```
  
  
  * Resource
  Never the less, this other statement create a new AWS AMI from a prexistent EBS snapshot.
  ```hcl
    resource "aws_ami" "example" {
    name                = "terraform-example"
    virtualization_type = "hvm"
    root_device_name    = "/dev/xvda"

    ebs_block_device {
      device_name = "/dev/xvda"
      snapshot_id = "snap-xxxxxxxx"
      volume_size = 8
    }
  }
  ```
