resource "aws_instance" "test" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"


  tags = {
    "team"    = "cloudsec"
    "project" = "workshop-iac"
    "Name"    = "IAC-Workshop-${terraform.workspace}"
  }
}
