# PART 1

# using data to access information of resource that provisioned outside this terraform
# use previous resource chapter as example

data "google_compute_instance" "this" {
  # use from 5-openvpn as example
  name = "vm-openvpn"
}
output "ip-address" {
  value = format("IP Address of existing server: %s", data.google_compute_instance.this.network_interface[0].access_config[0].nat_ip)
}


# PART 2
# create compute instance in all zone 
data "google_compute_zones" "available" {
}
resource "google_compute_instance" "all_zone" {
  count        = length(data.google_compute_zones.available.names)
  name         = "server_all_zone"
  machine_type = "e2-micro"
  zone         = data.google_compute_zones.available.names[count.index % length(data.google_compute_zones.available.names)]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
}

# using splat operator splat expression
output "zones-splat" {
  description = "list of zones using splat expression"
  value       = google_compute_instance.all_zone[*].zone
}

# using splat operator for expression
output "zones-for" {
  description = "List of zones using a for loop"
  value       = [for server in google_compute_instance.all_zone : server.zone]
}

output "zones-by-servers" {
  description = "Name of zone for each server"
  value       = [for s in google_compute_instance.all_zone[*] : "${s.name}: ${s.zone}"]
}

output "URL_0" {
  description = "URL of first server"
  value       = format("http://%s", google_compute_instance.all_zone[0].network_interface[0].access_config[0].nat_ip)
}
