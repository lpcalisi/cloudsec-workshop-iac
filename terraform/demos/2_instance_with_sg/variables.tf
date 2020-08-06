variable "MY_PUBLIC_IP_ADDRESS" {}

variable "PATH_PUBLIC_KEY" {
  type    = string
  default = "ssh/key_workshop.pub"
}

variable "AWS_REGION" {
  default = "us-east-1"
}


variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-000b3a073fc20e415"
  }
}

variable "VPCS" {
  type        = map(map(string))
  description = "Subnet ID by region"
  default = {
    us-east-1 = {
      "VPC"    = "vpc-52bc482f"
      "SUBNET" = "subnet-7db82a73"
    }
  }
}
