terraform {
  required_version = "~> 1.6.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.29.0"
    }
  }
}

# GCP Provider
provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
  zone    = var.gcp_zone
}

provider "google-beta" {
  project = var.gcp_project_id
  region  = var.gcp_region
  zone    = var.gcp_zone
}
