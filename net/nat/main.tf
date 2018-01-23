# This module provides an abstraction around creating AWS nate gateways.

resource "aws_eip" "eip" {
  vpc = true
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = "${aws_eip.eip.id}"
  subnet_id     = "${var.subnet_id}"
}

resource "aws_route" "route" {
  route_table_id         = "${var.route_table_id}"
  nat_gateway_id         = "${aws_nat_gateway.ngw.id}"
  destination_cidr_block = "0.0.0.0/0"
}
