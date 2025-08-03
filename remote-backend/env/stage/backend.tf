terraform {
  backend "s3" {
    bucket = "ajay-tf-state-lab-123h-hgs-345-dfr"
    key = "env/stage/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}