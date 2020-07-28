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
  public_key      = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCxdUZ2KMtzkk9m8NuAE9BHaV1wVsmbcClcPPk749r5EPV/9lZiaULWtwS+w9FjFliPlzOZ4QSSbpQHeV851RLpCXjyOfR2dPPuDZ8/K05miE40UIY2suBlomEo0HN9J+xHmr35vvKKxSAuMuk0XQDQsOxFgH6LGHJSbrubeJoJoQC2aPsLb+qwdmxWi6xSaCPqCV7QTQq+14E7oqf7cLcNLpEUcIdCVD35J7jTcNp4H1SPzrMxOdlhL6sPcMQ0A2hxJMArwWH9k2EXiG0l5S8/dg7xTXKcDaVXrYeijELdlG7Z+YWqPHMshTvOVhIDuy9LwFwMagIDVr6fxK+PqFACJjIina7et+c35rstTzqbMPPC+eewCGzea3cxGa0K2Al+ML9axhUyBAywwnU1jCZJDTqsUuy+i/QbXi1nYA/pCmtjemrBhiGJ7Ob6bwX4oo7y9edLJKrg2iMagB8VazbpqdVhi0cKfsfjKi486HPS+J7m0RaKcqllE3F+ncyJdWLxioscGb8OCETjGHql+CA51dOl8MLRJQBTRokLZqTQvXprj8pi3GPk2OkdpgwbuUdnzNJYwuQ7omieVMYahkkgBTOVCphuNssVVTAzZkliWAhayxwUNjZpQEDS1kGZMpm7q6NpGTIVp9SUndRx2Iy6K47Fw0TcWBFwv6JYiymSiw== workshop@mercadolibre.com"
}

# Launch EC2 Instance
resource "aws_instance" "project-ec2" {

  ami = data.ubuntu-linux-2004.aws_ami
  instance_type = var.config.instance_type

  associate_public_ip_address = true

  security_groups = [aws_security_group.webserver-sg.name]
  
  key_name = aws_key_pair.test_key.key_name

}

