#!/bin/bash

# Navigate to the terraform directory, initialize and apply configuration
cd terraform
echo "Initializing Terraform..."
terraform init

echo "Applying Terraform configuration..."
terraform apply -auto-approve

# Go to the ansible folder and run the playbook
cd ../ansible
echo "Running Ansible playbook..."
ansible-playbook -i hosts playbook.yml --private-key ../terraform/terraform.tfvars
