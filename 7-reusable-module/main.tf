# this is exmaple of local module

module "server1" {
  source       = "./modules/server"
  name         = "${var.server_name}-1"
  zone         = var.zone
  machine_type = var.machine_type
  static_ip    = true
}


module "server2" {
  source       = "./modules/server"
  name         = "${var.server_name}-2"
  zone         = var.zone
  machine_type = var.machine_type
  static_ip    = false
}


module "server3" {
  source       = "./modules/server"
  name         = "${var.server_name}-3"
  zone         = var.zone
  machine_type = "e2-small"
  static_ip    = true
}


# use more flexible module
# e.g more validation, abstraciton, etc

module "server4" {
  source = "./modules/server_flexible"
  name   = "${var.server_name}-4"
}

module "server5" {
  source       = "./modules/server_flexible"
  name         = "${var.server_name}-5"
  machine_type = "large"
  static_ip    = false
}


# moduke from gcp, your account need to have access to the bucket
module "module_gcp_1" {
  source = "gcs::https://www.googleapis.com/storage/v1/koko-terraform-for-gcp/modules/server_flexible"
  name   = "${var.server_name}-gcp-1"
}


# module from github
module "module_git_1" {
  source       = "git::https://github.com/PacktPublishing/Terraform-for-Google-Cloud-Essential-Guide.git//chap04/modules/server/"
  name         = "${var.server_name}-git-1"
  zone         = var.zone
  machine_size = "medium"
}


# using public module repositories
# example use https://registry.terraform.io/browse/modules?provider=google

module "network" {
  source       = "terraform-google-modules/network/google"
  version      = "9.1.0"
  project_id   = var.project_id
  network_name = "my-network"
  subnets = [
    {
      subnet_name   = "us-west1",
      subnet_region = "us-west1",
      subnet_ip     = "10.10.10.0/24"
    },
    {
      subnet_name   = "us-east1",
      subnet_region = "us-east1",
      subnet_ip     = "10.10.20.0/24"
    }
  ]
}

# using submodule from terraform public repository
module "firewall_rules" {
  source       = "terraform-google-modules/network/google//modules/firewall-rules"
  project_id   = var.project_id
  network_name = module.network.network_name
  version      = "9.1.0"

  rules = [{
    name                    = "${module.network.network_name}-deny-ssh-ingress"
    description             = null
    direction               = "INGRESS"
    priority                = null
    destination_ranges      = ["0.0.0.0/0"]
    source_ranges           = ["0.0.0.0/0"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    deny = [{
      protocol = "tcp"
      ports    = ["22"]
    }]
    allow = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }]
}
