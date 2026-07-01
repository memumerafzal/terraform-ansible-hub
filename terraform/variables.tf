variable "project_name" {
  description = "Project name, used for tagging and resource naming."
  type        = string
  default     = "terraform-ansible-hub"
}

variable "environment" {
  description = "Deployment environment (e.g. dev, staging, prod)."
  type        = string
  default     = "dev"
}

variable "region" {
  description = "AWS region to deploy into."
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type for the web server."
  type        = string
  default     = "t3.micro"
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH (port 22). Lock this to your own IP, e.g. 203.0.113.4/32."
  type        = string
  default     = "0.0.0.0/0"

  validation {
    condition     = can(cidrhost(var.allowed_ssh_cidr, 0))
    error_message = "allowed_ssh_cidr must be a valid CIDR block (e.g. 203.0.113.4/32)."
  }
}

variable "allowed_http_cidr" {
  description = "CIDR block allowed to reach HTTP (port 80)."
  type        = string
  default     = "0.0.0.0/0"
}

variable "key_pair_name" {
  description = "Name for the generated AWS key pair."
  type        = string
  default     = "terraform-ansible-hub-key"
}

variable "private_key_path" {
  description = "Local path where the generated private key is written for Ansible SSH."
  type        = string
  default     = "keys/terraform-ansible-hub.pem"
}
