output "instance_id" {
  description = "ID of the EC2 instance."
  value       = module.compute.instance_id
}

output "public_ip" {
  description = "Public IP address of the web server."
  value       = module.compute.public_ip
}

output "public_dns" {
  description = "Public DNS name of the web server."
  value       = module.compute.public_dns
}

output "website_url" {
  description = "URL of the Nginx demo site."
  value       = "http://${module.compute.public_ip}"
}

output "ssh_command" {
  description = "Ready-to-use SSH command for the instance."
  value       = "ssh -i ${var.private_key_path} ubuntu@${module.compute.public_ip}"
}

output "ansible_inventory_path" {
  description = "Path to the generated Ansible inventory."
  value       = local_file.ansible_inventory.filename
}
