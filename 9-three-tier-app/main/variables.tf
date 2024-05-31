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

variable "load_balancer" {
  type = map(any)
}

variable "mig" {
  type = map(any)
}
