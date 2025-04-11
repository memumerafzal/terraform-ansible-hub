variable "region" {
  description = "AWS region to deploy in"
  type        = string
  default     = "ap-south-1"
}

variable "ami" {
  description = "Ubuntu AMI ID (for the specified region)"
  type        = string
  default     = "ami-0a12fecf99cd5840a" # Update if needed for your region
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The AWS key pair name used for SSH access"
  type        = string
}

variable "private_key_path" {
  description = "Local file path to the private key (.pem)"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the instance will be deployed"
  type        = string
}
