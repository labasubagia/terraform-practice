# more sophisticated approach https://github.com/kwisser/create-cloud-compute-engine-ovpn-server
# this example just put <client_name>.opvn inside home/{var.vm_username}/ dir, download from it
# finally on local machine (vpn client) run `nmcli connection import type openvpn file <path-to-downloaded>/<client_name>.ovpn`

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
    sudo apt-get update
    mkdir -p /home/${var.vm_username}
    cd /home/${var.vm_username}
    curl -O https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh
    chmod +x openvpn-install.sh
    sudo AUTO_INSTALL=y ./openvpn-install.sh

    # add more client
    sudo MENU_OPTION="1" CLIENT="client_phone" PASS=1 ./openvpn-install.sh
    sudo MENU_OPTION="1" CLIENT="client_laptop1" PASS=1 ./openvpn-install.sh
    sudo MENU_OPTION="1" CLIENT="client_laptop2" PASS=1 ./openvpn-install.sh
    sudo MENU_OPTION="1" CLIENT="client_other" PASS=1 ./openvpn-install.sh

    # move all client .ovpn
    mv /root/*.ovpn /home/${var.vm_username}
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
