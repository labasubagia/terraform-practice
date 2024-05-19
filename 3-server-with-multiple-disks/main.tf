resource "google_compute_instance" "this" {
  provider     = google
  zone         = var.zone
  name         = var.server_name
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  # better write using dynamic block, see below
  #
  # attached_disk {
  #   source = google_compute_disk.this["small-disk"].name
  #   mode   = var.disks["small-disk"]["mode"]
  # }
  # attached_disk {
  #   source = google_compute_disk.this["medium-disk"].name
  #   mode   = var.disks["medium-disk"]["mode"]
  # }
  # attached_disk {
  #   source = google_compute_disk.this["large-disk"].name
  #   mode   = var.disks["large-disk"]["mode"]
  # }

  dynamic "attached_disk" {
    for_each = var.disks
    content {
      # better way to indicate that this vm is dependent to google_compute_disk.this
      # `attached_disk` is derived from each item of var.disks
      source = google_compute_disk.this[attached_disk.key].name
      mode   = attached_disk.value["mode"]
    }
  }

  network_interface {
    network = "default"
    access_config {
      # Ephemeral public IP
    }
  }
}

