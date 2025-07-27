terraform {
  backend "s3" {
    bucket         = "terraform-state-dev-ajay"
    key            = "envs/prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}