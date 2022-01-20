resource "aws_security_group" "postgres" {
  name        = "${format("%s", var.name)}"
  description = "${format("Security group for %s", var.name)}"
  vpc_id      = "${var.vpc_id}"

  lifecycle {
    create_before_destroy = true
  }

  tags = "${merge(var.tags, map("Name", format("%s", var.name)))}"
}

resource "aws_security_group_rule" "i_postgres" {
  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  security_group_id = "${aws_security_group.postgres.id}"
  cidr_blocks       = ["${var.allowed_cidrs}"]
}

resource "aws_security_group_rule" "e_postgres" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = "${aws_security_group.postgres.id}"
  cidr_blocks       = ["0.0.0.0/0"]
}
