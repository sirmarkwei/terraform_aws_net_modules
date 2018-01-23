output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "igw_id" {
  value = "${aws_internet_gateway.igw.id}"
}

output "public_route_table_id" {
  value = "${aws_route_table.public.id}"
}

output "private_route_table_id" {
  value = "${aws_route_table.private.id}"
}
