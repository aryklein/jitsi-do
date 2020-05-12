# Terraform version and provider

terraform {
  required_version = ">= 0.12"
}

provider "digitalocean" {
  token = var.do_token
}
