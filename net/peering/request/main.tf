# This module creates a VPC Peering connection between two VPCs and add's routes for far end

resource "aws_vpc_peering_connection" "peering_req" {
  peer_owner_id = "${var.accepter_account}"
  peer_vpc_id   = "${var.accepter_vpc_id}"
  vpc_id        = "${var.requester_vpc_id}"
  tags          = "${merge(var.default_tags, var.tags, map("Name", "${var.accepter_name}-peer"))}"
}

resource "aws_route" "add_route_requester" {
  count                     = "${length(var.requester_rts)}"
  route_table_id            = "${element(var.requester_rts, count.index)}"
  destination_cidr_block    = "${var.accepter_cidr}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.peering_req.id}"
}
