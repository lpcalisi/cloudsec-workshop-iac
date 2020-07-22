resource "aws_key_pair" "test_key" {
  key_name   = "test-workshop-iac-key"
  public_key = file(var.PATH_PUBLIC_KEY)
}

resource "aws_instance" "test" {
  ami = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  subnet_id = var.VPCS[var.AWS_REGION]["SUBNET"]
  key_name = aws_key_pair.test_key.key_name
  security_groups = [aws_security_group.test-ssh-connection.id]

  tags = {
    "team" = "cloudsec"
    "project" = "workshop-iac"
  }
}

resource "aws_security_group" "test-ssh-connection" {
  name        = "workshop-iac"
  description = "workshop iac cloudsec"
  vpc_id      = var.VPCS[var.AWS_REGION]["VPC"]

  ingress {
    description = "SSH from my pc"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MY_PUBLIC_IP_ADDRESS]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
  
output "external_ip" {
  value = "${aws_instance.test.public_ip}"
}