variable "gitlab" {
  type = map
  default = {
    token = ""
    repo_id = 18261340
  }
}

variable "aws" {
  type = map
  default = {
    domain = "example.com"
    # Tags
    tag_domain = "example.com"
    tag_client_name = "client_name"
    tag_environment  = "production"
  }
}
