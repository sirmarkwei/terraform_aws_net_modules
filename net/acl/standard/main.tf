resource "aws_network_acl" "public" {
  vpc_id     = "${var.vpc_id}"
  subnet_ids = ["${var.pub_subnet_ids}"]
  tags       = "${merge(var.default_tags, var.tags, map("Name", "${var.name}-public-acl"))}"
}

resource "aws_network_acl" "private" {
  vpc_id     = "${var.vpc_id}"
  subnet_ids = ["${var.priv_subnet_ids}"]
  tags       = "${merge(var.default_tags, var.tags, map("Name", "${var.name}-private-acl"))}"
}

resource "aws_network_acl_rule" "pub_inbound_acls_rules" {
  count          = "${length(concat(var.def_pub_inbound_rules,var.pub_inbound))}"
  network_acl_id = "${aws_network_acl.public.id}"
  egress         = false
  rule_action    = "allow"
  rule_number    = "${element(split("|",element(concat(var.def_pub_inbound_rules,var.pub_inbound),count.index)),0)}"
  protocol       = "${element(split("|",element(concat(var.def_pub_inbound_rules,var.pub_inbound),count.index)),1)}"
  from_port      = "${element(split("|",element(concat(var.def_pub_inbound_rules,var.pub_inbound),count.index)),2)}"
  to_port        = "${element(split("|",element(concat(var.def_pub_inbound_rules,var.pub_inbound),count.index)),3)}"
  cidr_block     = "${element(split("|",element(concat(var.def_pub_inbound_rules,var.pub_inbound),count.index)),4)}"
}

resource "aws_network_acl_rule" "priv_inbound_acls_rules" {
  count          = "${length(concat(var.def_priv_inbound_rules,var.priv_inbound))}"
  network_acl_id = "${aws_network_acl.private.id}"
  egress         = false
  rule_action    = "allow"
  rule_number    = "${element(split("|",element(concat(var.def_priv_inbound_rules,var.priv_inbound),count.index)),0)}"
  protocol       = "${element(split("|",element(concat(var.def_priv_inbound_rules,var.priv_inbound),count.index)),1)}"
  from_port      = "${element(split("|",element(concat(var.def_priv_inbound_rules,var.priv_inbound),count.index)),2)}"
  to_port        = "${element(split("|",element(concat(var.def_priv_inbound_rules,var.priv_inbound),count.index)),3)}"
  cidr_block     = "${element(split("|",element(concat(var.def_priv_inbound_rules,var.priv_inbound),count.index)),4)}"
}

/* "Use protocol-friend name (e.g. 'tcp' instead of '6'), except for "All protocols"
  -1 == all
  1 == icmp
  6 == tcp
  17 == udp
  51 == ah
  */

resource "aws_network_acl_rule" "public_acls_rules_icmp" {
  network_acl_id = "${aws_network_acl.public.id}"
  rule_number    = 15
  egress         = false
  protocol       = "icmp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
  icmp_code      = -1
  icmp_type      = -1
}

resource "aws_network_acl_rule" "private_acls_rules_icmp" {
  network_acl_id = "${aws_network_acl.private.id}"
  rule_number    = 15
  egress         = false
  protocol       = "icmp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
  icmp_code      = -1
  icmp_type      = -1
}

resource "aws_network_acl_rule" "pub_outbound_acls_rules" {
  count          = "${length(concat(var.def_pub_outbound_rules,var.pub_outbound))}"
  network_acl_id = "${aws_network_acl.public.id}"
  egress         = true
  rule_action    = "allow"
  rule_number    = "${element(split("|",element(concat(var.def_pub_outbound_rules,var.pub_outbound),count.index)),0)}"
  protocol       = "${element(split("|",element(concat(var.def_pub_outbound_rules,var.pub_outbound),count.index)),1)}"
  from_port      = "${element(split("|",element(concat(var.def_pub_outbound_rules,var.pub_outbound),count.index)),2)}"
  to_port        = "${element(split("|",element(concat(var.def_pub_outbound_rules,var.pub_outbound),count.index)),3)}"
  cidr_block     = "${element(split("|",element(concat(var.def_pub_outbound_rules,var.pub_outbound),count.index)),4)}"
}

resource "aws_network_acl_rule" "priv_outbound_acls_rules" {
  count          = "${length(concat(var.def_priv_outbound_rules,var.priv_outbound))}"
  network_acl_id = "${aws_network_acl.private.id}"
  egress         = true
  rule_action    = "allow"
  rule_number    = "${element(split("|",element(concat(var.def_priv_outbound_rules,var.priv_outbound),count.index)),0)}"
  protocol       = "${element(split("|",element(concat(var.def_priv_outbound_rules,var.priv_outbound),count.index)),1)}"
  from_port      = "${element(split("|",element(concat(var.def_priv_outbound_rules,var.priv_outbound),count.index)),2)}"
  to_port        = "${element(split("|",element(concat(var.def_priv_outbound_rules,var.priv_outbound),count.index)),3)}"
  cidr_block     = "${element(split("|",element(concat(var.def_priv_outbound_rules,var.priv_outbound),count.index)),4)}"
}
