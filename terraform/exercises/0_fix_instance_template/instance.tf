# Get latest Amazon Linux 2 AMI
data "aws_ami" "ubuntu-linux-2004" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# AWS Key Pair
resource "aws_key_pair" "test_key" {
  key_name_prefix = "test-workshop-iac-key"
  public_key      = file(var.PATH_PUBLIC_KEY)
}

# Launch EC2 Instance
resource "aws_instance" "project-ec2" {

  ami = data.ubuntu-linux-2004.aws_ami
  instance_type = var.config.instance_type

  associate_public_ip_address = true

  security_groups = [aws_security_group.webserver-sg.name]
  
  key_name = aws_key_pair.test_key.key_name

}

