provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "dev_bucket" {
  bucket = "ajay-dev-app-bucket-${random_id.rand.hex}"
  tags = {
    Environment = "dev"
  }
}

resource "random_id" "rand" {
  byte_length = 4
}