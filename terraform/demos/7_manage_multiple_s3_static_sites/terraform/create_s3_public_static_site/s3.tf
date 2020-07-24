
resource "aws_s3_bucket" "client-web-bucket" {
  bucket        = var.domain
  acl           = "public-read"
  force_destroy = true

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = var.tags
}


resource "aws_s3_bucket_policy" "public-access" {
  bucket = aws_s3_bucket.client-web-bucket.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "MYBUCKETPOLICY",
  "Statement": [
    {
      "Sid": "PublicAccess",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${var.domain}/*"
    }
  ]
}
POLICY
}
