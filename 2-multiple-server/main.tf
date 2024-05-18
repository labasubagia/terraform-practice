resource "google_compute_instance" "this" {
  provider                  = google
  count                     = 3
  name                      = "${var.server_name}-${count.index}"
  machine_type              = var.machine_type
  zone                      = var.zone
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.this["iowa"].name
    access_config {
      // Ephemeral public IP
    }
  }
  metadata_startup_script = file("startup.sh")

  tags = ["http-server"]

  lifecycle {
    ignore_changes = [labels]
  }
}

