variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-000b3a073fc20e415"
  }
}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "tags" {
  default = {
    "team"    = "cloudsec"
    "project" = "workshop-iac"
  }
}
