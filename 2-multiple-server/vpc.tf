resource "google_compute_network" "this" {
  project                 = var.project_id
  name                    = var.network
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "this" {
  project                  = var.project_id
  for_each                 = var.subnets
  network                  = resource.google_compute_network.this.name
  name                     = each.key
  region                   = each.value["region"]
  ip_cidr_range            = each.value["ip_cidr_range"]
  private_ip_google_access = true
}
