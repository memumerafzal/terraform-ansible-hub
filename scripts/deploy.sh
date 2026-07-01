#!/usr/bin/env bash
#
# End-to-end deploy: provision infrastructure with Terraform, then configure
# the instance with Ansible. Terraform generates both the SSH key and the
# Ansible inventory, so no manual wiring is required.
#
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TF_DIR="${ROOT_DIR}/terraform"
ANSIBLE_DIR="${ROOT_DIR}/ansible"

echo "==> [1/3] Initializing Terraform..."
terraform -chdir="${TF_DIR}" init -input=false

echo "==> [2/3] Provisioning infrastructure..."
terraform -chdir="${TF_DIR}" apply -auto-approve

PUBLIC_IP="$(terraform -chdir="${TF_DIR}" output -raw public_ip)"
echo "    Instance is up at ${PUBLIC_IP}"

echo "    Waiting for SSH to become available..."
for _ in $(seq 1 30); do
  if nc -z -w 3 "${PUBLIC_IP}" 22 2>/dev/null; then
    break
  fi
  sleep 5
done

echo "==> [3/3] Configuring server with Ansible..."
cd "${ANSIBLE_DIR}"
ansible-playbook playbook.yml

echo ""
echo "✅ Done. Visit: http://${PUBLIC_IP}"
