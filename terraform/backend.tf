# ---------------------------------------------------------------------------
# Remote state backend (recommended for teams and CI).
#
# By default this project uses LOCAL state so it is easy to demo. For real
# usage, provision an S3 bucket + DynamoDB lock table, uncomment the block
# below, then run:  terraform init -migrate-state
# ---------------------------------------------------------------------------
# terraform {
#   backend "s3" {
#     bucket         = "CHANGE-ME-tf-state-bucket"
#     key            = "terraform-ansible-hub/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-locks"
#     encrypt        = true
#   }
# }
