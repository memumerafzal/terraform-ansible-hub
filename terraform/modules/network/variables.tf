variable "name" {
  description = "Prefix used to name network resources."
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC to create the security group in."
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to reach SSH (port 22)."
  type        = string
}

variable "allowed_http_cidr" {
  description = "CIDR block allowed to reach HTTP (port 80)."
  type        = string
}
