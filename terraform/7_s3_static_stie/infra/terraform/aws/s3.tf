
resource "aws_s3_bucket" "client-web-bucket" {
  bucket = var.config.domain
  acl = "public-read"
  policy = file("./aws/allow_cloudflare_policy.json")

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
  
  tags = local.common_tags
}
