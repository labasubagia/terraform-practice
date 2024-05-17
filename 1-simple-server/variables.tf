variable "gcp_project_id" {
  type        = string
  description = "google cloud project id"
}

variable "gcp_region" {
  type        = string
  default     = "us-east1"
  description = "google cloud default region"
}


variable "gcp_zone" {
  type        = string
  default     = "us-east1-b"
  description = "google cloud default zone"
}
