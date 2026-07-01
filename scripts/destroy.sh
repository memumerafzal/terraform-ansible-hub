#!/usr/bin/env bash
#
# Tear down all infrastructure created by this project.
#
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TF_DIR="${ROOT_DIR}/terraform"

echo "==> Destroying infrastructure..."
terraform -chdir="${TF_DIR}" destroy -auto-approve

echo "✅ All resources destroyed."
