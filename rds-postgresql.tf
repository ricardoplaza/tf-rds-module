module "rds-database" {
  source  = "terraform-aws-modules/rds/aws"
  version = "1.30.0"

  identifier = var.name[terraform.workspace]

  # All available versions: http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_postgres.html#postgres.Concepts.VersionMgmt
  engine              = "postgres"
  engine_version      = var.engine_version[terraform.workspace]
  instance_class      = var.instance_class[terraform.workspace]
  allocated_storage   = var.allocated_storage[terraform.workspace]
  storage_encrypted   = false
  multi_az            = "${length(var.subnet_ids[terraform.workspace]) > 1}"
  publicly_accessible = false

  # kms_key_id        = "arm:aws:kms:<region>:<accound id>:key/<kms key id>"
  username = var.username[terraform.workspace]
  password = var.password[terraform.workspace]
  port     = "5432"

  vpc_security_group_ids = concat(var.security_group_ids, list(aws_security_group.postgres.id))

  maintenance_window = var.maintenance_window
  backup_window      = var.backup_window

  backup_retention_period = var.backup_retention_period
  
  allow_major_version_upgrade = var.allow_major_version_upgrade

  # DB subnet group
  subnet_ids = var.subnet_ids[terraform.workspace]

  # DB parameter group
  family = var.family[terraform.workspace]
  parameter_group_name = var.parameter_group_name

  snapshot_identifier = var.snapshot_identifier

  # Snapshot name upon DB deletion
  final_snapshot_identifier = var.name[terraform.workspace]

  tags = var.tags
}
