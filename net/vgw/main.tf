#This module creates a VGW

resource "aws_vpn_gateway" "vgw" {
  vpc_id = "${var.vpc_id}"
  tags   = "${merge(var.default_tags, var.tags, map("Name", "${var.vpc_name}-vgw"))}"
}
