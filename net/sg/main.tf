# This module provides an abstraction around creating AWS subnets.
resource "aws_security_group" "sg" {
  name        = "${var.name}"
  description = "${var.sg_description}"
  vpc_id      = "${var.vpc_id}"
  tags        = "${merge(var.default_tags, var.tags, map("Name", "SG-${var.name}"))}"
}

resource "aws_security_group_rule" "cidr_rules" {
  count             = "${length(var.cidr_rule_set)}"
  security_group_id = "${aws_security_group.sg.id}"
  type              = "${element(split("|",element(var.cidr_rule_set,count.index)),0)}"
  protocol          = "${element(split("|",element(var.cidr_rule_set,count.index)),1)}"
  from_port         = "${element(split("|",element(var.cidr_rule_set,count.index)),2)}"
  to_port           = "${element(split("|",element(var.cidr_rule_set,count.index)),3)}"
  cidr_blocks       = ["${element(split("|",element(var.cidr_rule_set,count.index)),4)}"]
}

resource "aws_security_group_rule" "sg_rules" {
  count                    = "${length(var.sg_rule_set)}"
  security_group_id        = "${aws_security_group.sg.id}"
  type                     = "${element(split("|",element(var.sg_rule_set,count.index)),0)}"
  protocol                 = "${element(split("|",element(var.sg_rule_set,count.index)),1)}"
  from_port                = "${element(split("|",element(var.sg_rule_set,count.index)),2)}"
  to_port                  = "${element(split("|",element(var.sg_rule_set,count.index)),3)}"
  source_security_group_id = "${element(split("|",element(var.sg_rule_set,count.index)),4)}"
}

resource "aws_security_group_rule" "self_rule_set" {
  count             = "${length(var.self_rule_set)}"
  security_group_id = "${aws_security_group.sg.id}"
  type              = "${element(split("|",element(var.self_rule_set,count.index)),0)}"
  protocol          = "${element(split("|",element(var.self_rule_set,count.index)),1)}"
  from_port         = "${element(split("|",element(var.self_rule_set,count.index)),2)}"
  to_port           = "${element(split("|",element(var.self_rule_set,count.index)),3)}"
  self              = true
}

resource "aws_security_group_rule" "add_any_any_default_outbound" {
  count             = "${var.allow_def_outbound ? 1: 0 }"
  security_group_id = "${aws_security_group.sg.id}"
  type              = "egress"
  protocol          = "all"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
}
