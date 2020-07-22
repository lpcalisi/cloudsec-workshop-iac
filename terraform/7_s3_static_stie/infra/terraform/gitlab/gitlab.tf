provider "gitlab" {
  token = var.config.token
}

variable "config" {}
variable "outputs" {}