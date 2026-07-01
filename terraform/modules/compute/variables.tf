variable "name" {
  description = "Prefix used to name compute resources."
  type        = string
}

variable "ami_id" {
  description = "AMI ID to launch the instance from."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "key_name" {
  description = "Name of the AWS key pair for SSH access."
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs to attach to the instance."
  type        = list(string)
}

variable "root_volume_size" {
  description = "Size of the root EBS volume in GB."
  type        = number
  default     = 8
}
