output "eip_id" {
  value = "${aws_eip.eip.id}"
}

output "ngw_id" {
  value = "${aws_nat_gateway.ngw.id}"
}
