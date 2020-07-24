variable "aws" {
  default = {
		domain = "workshopmeli.ml"
		tags = {
			workshop = "cloudsec_terraform"
			environment = "test"
		}
  }
}
