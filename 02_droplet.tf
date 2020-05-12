# Jitsi droplet definition

resource "digitalocean_droplet" "jitsi_01" {
  image     = "ubuntu-20-04-x64"
  name      = "jitsi-01"
  region    = var.region
  size      = var.size
  ssh_keys  = [digitalocean_ssh_key.terraform_ssh_key.fingerprint]
  user_data = templatefile("cloud-init.yml", {
    init_terrafor_ssh_pub_key = file(var.terraform_ssh_pub_key)
    }
  )
}
