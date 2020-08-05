provider "aws" {
  version = "~> 2.0"
  region = "us-east-1"
}

resource "random_id" "id" {
  byte_length = 8
}
