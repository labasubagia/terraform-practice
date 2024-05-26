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
