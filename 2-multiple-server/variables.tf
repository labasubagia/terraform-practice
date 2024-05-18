variable "project_id" {
  type        = string
  description = "google cloud project id"
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "google cloud default region"
}


variable "zone" {
  type        = string
  default     = "us-central1-a"
  description = "google cloud default zone"
}

variable "server_name" {
  type        = string
  description = "Name of webserver"
}

variable "machine_type" {
  type        = string
  description = "Machine type"
  default     = "e2-micro"
}

variable "network" {
  type = string
}

variable "subnets" {
  type = map(any)
}

variable "firewall" {
  type = list(any)
}
