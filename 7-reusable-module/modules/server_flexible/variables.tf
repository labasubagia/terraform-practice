variable "name" {
  type = string
}

variable "machine_type" {
  type    = string
  default = "small"
  validation {
    condition     = contains(["small", "medium", "large"], var.machine_type)
    error_message = "The machine size must be one of small, medium and large"
  }
}

variable "zone" {
  type    = string
  default = "asia-southeast1-a"
}

variable "static_ip" {
  type    = bool
  default = true
}
