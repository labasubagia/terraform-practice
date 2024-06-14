variable "project_id" {
  type = string
}

variable "container_images" {
  type = map(string)
}

variable "network" {
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

variable "subnets" {
  type = list(object({
    name          = string
    region        = string
    ip_cidr_range = string
  }))
}

variable "services" {
  type = list(string)
}

variable "roles" {
  type = list(string)
}

variable "sa_name" {
  type = string
}

variable "vpc_connector_name" {
  type = string
}
