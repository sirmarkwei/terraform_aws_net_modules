#Module associates a zone to a VPC

resource "aws_route53_zone_association" "zone" {
  zone_id = "${var.zone_id}"
  vpc_id  = "${var.vpc_id}"
}
