terraform {
  backend "s3" {
    bucket = "pelu-workshop-example"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

