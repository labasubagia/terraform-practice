module "vpc" {
  source     = "git::https://github.com/terraform-google-modules/terraform-google-network.git?ref=4788b5cfac97c464cc7ea84a95a1eccbbaf1cb1a"
  depends_on = [google_project_service.this["compute"]]

  project_id   = var.project_id
  network_name = var.network.name

  subnets = [
    {
      subnet_name           = var.network.subnetwork_name
      subnet_ip             = var.network.nodes_cidr_range
      subnet_region         = var.region
      subnet_private_access = "true"
    }
  ]

  secondary_ranges = {
    (var.network.subnetwork_name) = [
      {
        range_name    = "${var.network.subnetwork_name}-pods"
        ip_cidr_range = var.network.pods_cidr_range
      },
      {
        range_name    = "${var.network.subnetwork_name}-services"
        ip_cidr_range = var.network.services_cidr_range
      }
    ]
  }

  firewall_rules = [
    {
      name      = "${var.network.name}-allow-iap-ssh-ingress"
      direction = "INGRESS"
      ranges    = ["35.235.240.0/20"]
      allow = [{
        protocol = "tcp"
        ports    = ["22"]
      }]
    }
  ]
}
