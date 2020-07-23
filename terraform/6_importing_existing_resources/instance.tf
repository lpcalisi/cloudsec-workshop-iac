resource "aws_instance" "test" {
  ami                  = "ami-0affd4508a5d2481b"
  instance_type        = "t2.micro"
  iam_instance_profile = "CloudSec-SSM-EC2-EC2DefaultRoleInstanceProfile"
}
