terraform {
  backend "s3" {
    bucket               = "ricardoplaza-infrastructure"
    region               = "eu-west-1"
    workspace_key_prefix = "ricardoplaza-infrastructure/rds-postgresql"
    key                  = "terraform_state"
    encrypt              = "true"
    dynamodb_table       = "ricardoplaza_terraform_rds_postgresql_lock"
  }
}

data "external" "s3_secrets" {
  program = ["aws", "s3", "cp", "s3://ricardoplaza-secrets/ricardoplaza-rds-postgresql-secrets.json", "-"]
}