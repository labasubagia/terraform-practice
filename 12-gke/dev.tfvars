project_id = "project-koko-370310"
region     = "asia-southeast2"
zone       = "asia-southeast2-a"

network = {
  name            = "dev-gke-network"
  subnetwork_name = "asia-southeast2"
}

gke = {
  name  = "dev-gke-cluster"
  zones = ["asia-southeast2-a"]
}

node_pool = {
  name         = "dev-node-pool"
  machine_type = "e2-standard-2"
}

service_account = {
  name  = "dev-sa"
  roles = []
}
