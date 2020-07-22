#terraform {
  #backend "s3" {
    #bucket = "transporterugiero-terraform-states"
    #key    = "web-trasnporterugiero/terraform.tfstate"
    #region = "us-east-1"
  #}
#}

module "aws" {
  source = "./aws"
  config = var.aws
  outputs = { 
   repo_url  = module.gitlab.repo_url
   repo_path = module.gitlab.repo_path
   repo_name = module.gitlab.repo_name
  }
}

module "gitlab" {
  source = "./gitlab"
  config = var.gitlab
  outputs = ""
}



output "repo_url" {
  value = module.gitlab.repo_url
}

output "repo_path" {
value = module.gitlab.repo_path
}

output "repo_name" {
value = module.gitlab.repo_name
}
