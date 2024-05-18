# Disable default network
# https://cloud.google.com/architecture/framework/security/network-security#disable_default_networks

resource "google_compute_network" "this" {
  project = var.project_id
  name    = var.network

  # we'll create custom subnetworks
  auto_create_subnetworks = false
}

# for this example will read var.subnets with
# several subnets in different regions with different Classless Inter-Domain Routing (CIDR) ranges
resource "google_compute_subnetwork" "this" {
  project  = var.project_id
  for_each = var.subnets

  # self_link indicate dependency to other request
  # other way is to use depends_on, this is just cleaner (personal preference)
  network                  = resource.google_compute_network.this.name
  name                     = each.key
  region                   = each.value["region"]
  ip_cidr_range            = each.value["ip_cidr_range"]
  private_ip_google_access = true
}
