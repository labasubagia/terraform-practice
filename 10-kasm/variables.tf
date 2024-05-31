variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "asia-southeast1"
}

variable "zone" {
  type    = string
  default = "asia-southeast1-a"
}

variable "server_name" {
  type    = string
  default = "vm-kasm"
}

variable "password_admin" {
  type        = string
  description = "kasm admin password"
}

variable "password_user" {
  type        = string
  description = "kasm user password"
}
