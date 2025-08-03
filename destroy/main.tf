terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "random_id" "random" {
  byte_length = 4
}

resource "aws_instance" "demo" {
  ami           = "ami-0d0ad8bb301edb745"
  instance_type = "t2.micro"

  tags = {
    Name = "Demo"
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = "demo-bucket-${random_id.random.hex}"

  tags = {
    Name = "Demo-bucket"
  }
}