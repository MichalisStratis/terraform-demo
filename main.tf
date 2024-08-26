# main.tf

provider "local" {}

resource "local_file" "example" {
  content  = "This is a test file created by Terraform!"
  filename = "${path.module}/example_file.txt"
