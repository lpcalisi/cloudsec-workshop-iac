# Configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}


variable "config" {}
variable "outputs" {}


locals {
  common_tags = {
    # Custom Tags
    client = var.config.tag_client_name
    domain = var.config.tag_domain
    project = var.outputs.repo_path
    environment  = var.config.tag_environment
    terraform = var.config.tag_terraform_state
  }
}
