variable "project_id" {
  type = string
}

variable "services" {
  type = list(string)
}

variable "region" {
  type    = string
  default = "asia-southeast1"
}

variable "zone" {
  type    = string
  default = "asia-southeast1-a"
}

variable "network" {
  type = string
}

variable "subnets" {
  type = list(object({
    name          = string
    region        = string
    ip_cidr_range = string
  }))
}

variable "sa_name" {
  type = string
}

variable "roles" {
  type = list(string)
}
