# variables definition

variable "do_token" {
  description = "DigitalOcean Api Token"
}

variable "terraform_ssh_pub_key" {
  description = "Terraform public SSH key"
  default     = "~/.ssh/terraform-do.pub"
}

variable "region" {
  description = "Droplet region"
  default     = "nyc3"
}

variable "size" {
  description = "Droplet size"
  default     = "s-1vcpu-1gb"
}
