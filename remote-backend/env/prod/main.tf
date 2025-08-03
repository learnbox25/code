provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "prod_bucket" {
  bucket = "ajay-prod-app-bucket-${random_id.rand.hex}"
  tags = {
    Environment = "prod"
  }
}

resource "random_id" "rand" {
  byte_length = 4
}