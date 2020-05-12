# DNS entry for the Jitsi instance
resource "digitalocean_record" "meet_kleinerman_org" {
  domain = "kleinerman.org"
  type   = "A"
  name   = "meet"
  ttl    = "600"
  value  = digitalocean_droplet.jitsi_01.ipv4_address
}
