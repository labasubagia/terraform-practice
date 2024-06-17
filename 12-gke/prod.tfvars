project_id = "project-koko-370310"
region     = "asia-southeast1"
zone       = "asia-southeast1-a"

network = {
  name                = "prod-gke-network"
  subnetwork_name     = "asia-southeast1"
  nodes_cidr_range    = "10.128.0.0/20"
  pods_cidr_range     = "10.4.0.0/14"
  services_cidr_range = "10.8.0.0/20"
}

gke = {
  name     = "prod-gke-cluster"
  regional = true
  zones    = ["asia-southeast1-a", "asia-southeast1-b", "asia-southeast1-c"]
}

node_pool = {
  name               = "prod-node-pool"
  machine_type       = "e2-small"
  disk_size_gb       = 20
  spot               = false
  initial_node_count = 2
  max_count          = 5
}

services = [
  "cloudresourcemanager",
  "compute",
  "iam",
  "servicenetworking",
  "container"
]

service_account = {
  name  = "prod-sa"
  roles = []
}
