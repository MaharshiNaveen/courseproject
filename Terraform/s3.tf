terraform {
  backend "s3" {
    bucket = "maharshinnaveenassignement"
    key    = "home/ubuntu/project/.terraform/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}