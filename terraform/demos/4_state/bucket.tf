resource "aws_s3_bucket" "bucket" {
  bucket = "terraform-workshop-bucket-${random_id.id.hex}"
  acl    = "private"

  tags = {
    Name = "My bucket"
  }
}
