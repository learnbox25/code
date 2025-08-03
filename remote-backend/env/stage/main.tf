provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "stage_bucket" {
  bucket = "ajay-stage-app-bucket-${random_id.rand.hex}"
  tags = {
    Environment = "stage"
  }
}

resource "random_id" "rand" {
  byte_length = 4
}