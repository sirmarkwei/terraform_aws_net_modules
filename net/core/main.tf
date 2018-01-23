# This module creates AWS VPCs

resource "aws_vpc" "vpc" {
  cidr_block           = "${var.cidr}"
  enable_dns_hostnames = true
  tags                 = "${merge(var.default_tags, var.tags, map("Name", "${var.name}-vpc"))}"
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags   = "${merge(var.default_tags, var.tags, map("Name", "${var.name}-rt-priv"))}"
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags   = "${merge(var.default_tags, var.tags, map("Name", "${var.name}-rt-pub"))}"
}

resource "aws_main_route_table_association" "main" {
  vpc_id         = "${aws_vpc.vpc.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags   = "${merge(var.default_tags, var.tags, map("Name", "${var.name}-igw"))}"
}

resource "aws_route" "igw" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = "${aws_route_table.public.id}"
  gateway_id             = "${aws_internet_gateway.igw.id}"
}

resource "aws_default_network_acl" "default" {
  default_network_acl_id = "${aws_vpc.vpc.default_network_acl_id}"

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = "${merge(var.default_tags, var.tags, map("Name", "${var.name}-default-acl"))}"
}
