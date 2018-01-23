# This module provides an abstraction around creating AWS subnets.

resource "aws_subnet" "subnet" {
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${var.cidr_block}"
  availability_zone       = "${var.availability_zone}"
  tags                    = "${merge(var.default_tags, var.tags, map("Name", var.name))}"
  map_public_ip_on_launch = "${var.private ? false : true}"
}

resource "aws_route_table_association" "rta" {
  subnet_id      = "${aws_subnet.subnet.id}"
  route_table_id = "${var.route_table_id}"
}
