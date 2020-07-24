terraform {
  backend "s3" {
    bucket = "workshop-public-static-sites"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

