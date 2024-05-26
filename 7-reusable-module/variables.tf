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

variable "server_name" {
  type        = string
  description = "server name"
  default     = "server-module"
}


variable "machine_type" {
  type        = string
  description = "machine type"
  default     = "e2-micro"
}
