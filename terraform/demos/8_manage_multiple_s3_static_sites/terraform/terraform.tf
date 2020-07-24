
module "aws" {
  source = "./create_s3_public_static_site"
  tags   = var.tags
  domain = var.domain
}


output "website_endpoint" {
  value = module.aws.s3_website_endpoint
}
