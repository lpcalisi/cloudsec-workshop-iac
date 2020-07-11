variable "MY_PUBLIC_IP_ADDRESS" {}

variable "PATH_PUBLIC_KEY" {
    type = string
    default = "ssh/key_workshop.pub"
}

variable "AWS_REGION" {
	default = "us-east-1"
}


variable "AMIS" {
	type = map(string)
	default = {
		us-east-1 = "ami-0f9c9884b78c1a3f6"
	}
}

variable "VPCS" {
    type = map(map(string))
    description = "Subnet ID by region"
    default = {
        us-east-1 = {
            "VPC" = "vpc-ea85138e"
            "SUBNET" = "subnet-9a7a9fc2"
        }
    }
}
