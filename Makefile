.DEFAULT_GOAL := help
TF_DIR      := terraform
ANSIBLE_DIR := ansible

.PHONY: help init fmt validate lint ci plan apply configure deploy destroy clean

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}'

init: ## terraform init
	cd $(TF_DIR) && terraform init

fmt: ## Format Terraform files
	cd $(TF_DIR) && terraform fmt -recursive

validate: ## Validate Terraform
	cd $(TF_DIR) && terraform init -backend=false && terraform validate

lint: ## Lint Terraform and Ansible
	cd $(TF_DIR) && tflint --recursive
	cd $(ANSIBLE_DIR) && ansible-lint

ci: ## Run the exact GitHub Actions CI checks locally
	cd $(TF_DIR) && terraform fmt -check -recursive
	cd $(TF_DIR) && terraform init -backend=false && terraform validate
	cd $(TF_DIR) && tflint --init && tflint --recursive
	cd $(TF_DIR) && tfsec .
	yamllint $(ANSIBLE_DIR)
	cd $(ANSIBLE_DIR) && ansible-lint

plan: ## Show Terraform plan
	cd $(TF_DIR) && terraform plan

apply: ## Provision infrastructure with Terraform
	cd $(TF_DIR) && terraform apply -auto-approve

configure: ## Configure the server with Ansible
	cd $(ANSIBLE_DIR) && ansible-playbook playbook.yml

deploy: ## Full pipeline: provision then configure
	./scripts/deploy.sh

destroy: ## Tear down all infrastructure
	./scripts/destroy.sh

clean: ## Remove local state, keys and generated inventory
	rm -rf $(TF_DIR)/.terraform $(TF_DIR)/keys
	rm -f  $(TF_DIR)/terraform.tfstate* $(ANSIBLE_DIR)/inventory/hosts.ini
