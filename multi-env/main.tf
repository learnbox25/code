provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "env-bucket" {
  bucket        = "demo-${var.env}erf-grt-478-ouj"
  force_destroy = true
}

output "bucket_name" {
  value = aws_s3_bucket.env-bucket.id
}

