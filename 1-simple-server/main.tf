resource "google_compute_instance" "this" {
  provider = google-beta

  name         = "cloudshell"
  machine_type = "e2-small"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }
  metadata_startup_script = file("startup.sh")

  tags = ["http-server"]
}

