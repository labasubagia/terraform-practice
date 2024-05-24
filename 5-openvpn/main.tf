
# more sophisticated approach https://github.com/kwisser/create-cloud-compute-engine-ovpn-server
# this example just put client.opvn inside home/{var.vm_username} dir, download from it
# finally on local machine (vpn client) run `nmcli connection import type openvpn file <path-to-downloaded>/client.ovpn`

resource "google_compute_instance" "default" {
  zone         = var.zone
  name         = var.server_name
  machine_type = var.machine_type

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

  metadata_startup_script = <<EOF
    sudo apt-get update \
    && mkdir -p /home/${var.vm_username} \
    && cd /home/${var.vm_username} \
    && curl -O https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh \
    && chmod +x openvpn-install.sh \
    && sudo AUTO_INSTALL=y ./openvpn-install.sh \
    && mv /root/client.ovpn /home/${var.vm_username}
  EOF
}

# openvpn firewall
resource "google_compute_firewall" "default" {
  project = var.project_id
  name    = "openvpn"
  network = "default"

  allow {
    protocol = "udp"
    ports    = ["1194"]
  }
  source_ranges = ["0.0.0.0/0"]
}
