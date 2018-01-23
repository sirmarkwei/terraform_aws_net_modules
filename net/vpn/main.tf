#This module creates a CGW and a VPN connection and ties it to a VGW. It also add's vpn connection to route tables

resource "aws_customer_gateway" "cgw" {
  bgp_asn    = 65125
  ip_address = "${var.target_ip}"
  type       = "ipsec.1"
  tags       = "${merge(var.default_tags, var.tags, map("Name", "${var.remote_name}-cgw"))}"
}

resource "aws_vpn_connection" "vpn-conn" {
  vpn_gateway_id      = "${var.vgw_id}"
  customer_gateway_id = "${aws_customer_gateway.cgw.id}"
  type                = "ipsec.1"
  static_routes_only  = true
  tags                = "${merge(var.default_tags, var.tags, map("Name", "${var.remote_name}-vpn-conn"))}"
}

resource "aws_vpn_connection_route" "vpn-conn-route" {
  count                  = "${length(var.routes)}"
  destination_cidr_block = "${element(var.routes, count.index)}"
  vpn_connection_id      = "${aws_vpn_connection.vpn-conn.id}"
}

resource "aws_route" "private" {
  count                  = "${var.private_route_table_id != "" ? length(var.routes) : 0}"
  route_table_id         = "${var.private_route_table_id}"
  destination_cidr_block = "${element(var.routes, count.index)}"
  gateway_id             = "${var.vgw_id}"
}

resource "aws_route" "public" {
  count                  = "${var.public_route_table_id != "" ? length(var.routes) : 0}"
  route_table_id         = "${var.public_route_table_id}"
  destination_cidr_block = "${element(var.routes, count.index)}"
  gateway_id             = "${var.vgw_id}"
}
