variable "project_id" {
  type        = string
  description = "google cloud project id"
}

variable "region" {
  type        = string
  description = "default region"
  default     = "asia-southeast1"
}

variable "zone" {
  type        = string
  description = "default zone"
  default     = "asia-southeast1-a"
}

variable "server_name" {
  type        = string
  description = "name of server"
}

variable "machine_type" {
  type        = string
  description = "Machine Type"
  default     = "e2-micro"
}
