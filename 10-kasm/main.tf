resource "google_compute_instance" "default" {
  zone = var.zone
  name = var.server_name

  # min cpu 2, ram 4gb
  # choose better machine_type, e2-medium still laggy
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      # min ssd 50gb
      type = "pd-ssd"
      size = 50
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  metadata_startup_script = <<EOF
    sudo apt-get update
    cd /tmp
    curl -O https://kasm-static-content.s3.amazonaws.com/kasm_release_1.15.0.06fdc8.tar.gz
    tar -xf kasm_release_1.15.0.06fdc8.tar.gz
    sudo bash kasm_release/install.sh --accept-eula --swap-size 8192 --admin-password ${var.password_admin} --user-password ${var.password_user} >> kasm_install.txt
  EOF

  tags = ["http-server", "https-server"]
}

resource "google_compute_firewall" "default" {
  name    = "allow-http-https"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"] # kasm default port 443
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server", "https-server"]
}
