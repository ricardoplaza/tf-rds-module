variable "name" {
  type = map
  default = {
    "dev"   = "postgresql-dev"
    "pre"   = "postgresql-pre"
    "pro"   = "postgresql-pro"
  }
}

variable "engine_version" {
  type = map
  default = {
    "dev"   = "11.10"
    "pre"   = "11.10"
    "pro"   = "11.10"
  }
}

variable "instance_class" {
  type = map
  default = {
    "dev"   = "db.m6g.large"
    "pre"   = "db.m6g.large"
    "pro"   = "db.m6g.large"
  }
}

variable "allocated_storage" {
  type = map
  default = {
    "dev"   = "10"
    "pre"   = "100"
    "pro"   = "1000"
  }
}

variable "username" {
  type = map
  default = {
    "dev"   = "${data.external.s3_secrets.result.postgresql_ricardoplaza_root_user}"
    "pre"   = "${data.external.s3_secrets.result.postgresql_ricardoplaza_root_user}"
    "pro"   = "${data.external.s3_secrets.result.postgresql_ricardoplaza_root_user}"
  }
}

variable "password" {
  type = map
  default = {
    "dev"   = "${data.external.s3_secrets.result.postgresql_ricardoplaza_root_password}"
    "pre"   = "${data.external.s3_secrets.result.postgresql_ricardoplaza_root_password}"
    "pro"   = "${data.external.s3_secrets.result.postgresql_ricardoplaza_root_password}"
  }
}


variable "parameter_group_name" {
  default = ""
}

variable "snapshot_identifier" {
  default = ""
}

variable "allow_major_version_upgrade" {
  default = false
}


variable "vpc_id" {}

variable "security_group_ids" {
  type    = "list"
  default = []
}

variable "maintenance_window" {
  default = "Sun:05:00-Sun:08:00"
}

variable "backup_window" {
  default = "03:00-08:00"
}

variable "backup_retention_period" {
  default = 0
}

variable "subnet_ids" {
  type = "list"
}

variable "allowed_cidrs" {
  type    = "list"
  default = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  default     = {}
}

variable "apply_immediately" {
  default = true
}
