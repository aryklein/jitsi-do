# Terraform version and provider

terraform {
  required = ">= 0.12"
}

provider "digitalocean" {
  token = var.do_token
}
