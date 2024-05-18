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
    # all 3 instance will use iowa for this example
    # self link indicate dependencies to other resource
    subnetwork = google_compute_subnetwork.this["iowa"].name
    access_config {
      // Ephemeral public IP
    }
  }
  metadata_startup_script = file("startup.sh")

  tags = ["http-server"]

  # custom things that happend during resource change
  # for this example, every change in labels will be ignore
  lifecycle {
    ignore_changes = [labels]
  }
}

