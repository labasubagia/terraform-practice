terraform {
  required_version = "~> 1.8.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.29.0"
    }
  }
}

# GCP Provider
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}
