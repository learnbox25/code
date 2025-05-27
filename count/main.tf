terraform {
  required_version = ">= 1.6.0"
}

provider "aws" {
  region = "us-east-1"
}

variable "vm_count" {
  default = 3
}

resource "null_resource" "this" {
  count = var.vm_count
  triggers = {
    name = "null-resource-${count.index}"
  }
}