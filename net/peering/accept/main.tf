#This module accepts a VPC peering request and add's route's for the far end to a routing table.

resource "aws_vpc_peering_connection_accepter" "accept_peering" {
  vpc_peering_connection_id = "${var.peering_id}"
  auto_accept               = true
  tags                      = "${merge(var.default_tags, var.tags, map("Name", "${var.requester_name}-peer"))}"
}

resource "aws_route" "add_route_requester" {
  count                     = "${length(var.accepter_rts)}"
  route_table_id            = "${element(var.accepter_rts, count.index)}"
  destination_cidr_block    = "${var.requester_cidr}"
  vpc_peering_connection_id = "${var.peering_id}"
}
