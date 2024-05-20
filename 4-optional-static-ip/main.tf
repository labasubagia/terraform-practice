resource "google_compute_address" "static" {
  count = var.static_ip ? 1 : 0
  name  = "ipv4-address"
}

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

  network_interface {
    network = "default"
    # access_config {
    #   nat_ip = var.static_ip ? google_compute_address.static[0].address : null
    # }


    # There is other way to do it using dynamic
    # when there is no google_compute_addres.static created this code below will evaluate as null
    dynamic "access_config" {
      for_each = google_compute_address.static
      content {
        nat_ip = google_compute_address.static[0].address
      }
    }

  }
}

