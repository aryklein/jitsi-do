# Digitalocean SSH public key authentication

resource "digitalocean_ssh_key" "terraform_ssh_key" {
  name       = "terraform-ssh-key"
  public_key = file(var.terraform_ssh_pub_key)
}
