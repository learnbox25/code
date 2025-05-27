variable "number" {
  type = number
  default = 3
}

resource "null_resource" "this" {
  count = var.number
  triggers = {
    name = "null-resource-${count.index}"
  }
}