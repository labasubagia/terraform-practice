variable "project_id" {
  type        = string
  description = "google cloud project id"
}

variable "region" {
  type        = string
  default     = "asia-southeast1"
  description = "google cloud default region"
}

variable "zone" {
  type        = string
  default     = "asia-southeast1-a"
  description = "google cloud default zone"
}

variable "network" {
  description = "network for k8s"
  type = object({
    name                = string
    subnetwork_name     = string
    nodes_cidr_range    = optional(string, "10.128.0.0/20")
    pods_cidr_range     = optional(string, "10.4.0.0/14")
    services_cidr_range = optional(string, "10.8.0.0/20")
  })
}

variable "gke" {
  description = "gke settings"
  type = object({
    name     = string
    regional = optional(bool, false)
    zones    = list(string)
  })
}

variable "node_pool" {
  description = "node pool setting in k8s"
  type = object({
    name               = string
    machine_type       = optional(string, "e2-small")
    spot               = optional(bool, false)
    initial_node_count = optional(number, 2)
    max_count          = optional(number, 4)
    disk_size_gb       = optional(number, 10)
  })
}

variable "service_account" {
  description = "service account"
  type = object({
    name  = string
    roles = list(string)
  })
}

variable "services" {
  description = "list of services used in this infra"
  type        = list(string)
  default     = ["cloudresourcemanager", "compute", "container", "iam", "servicenetworking"]
}
