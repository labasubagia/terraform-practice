variable "name" {
  type = string
}

variable "machine_size" {
  type    = string
  default = "small"
  validation {
    condition     = contains(["small", "medium", "large"], var.machine_size)
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

variable "environment" {
  type        = string
  description = "type of environment"
  default     = "dev"
}
