output "s3_website_endpoint" {
  value = aws_s3_bucket.client-web-bucket.website_endpoint
}
