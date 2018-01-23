#This module creates a private Route53 Zone and attaches it to a VPC

resource "aws_route53_zone" "zone" {
  name   = "${var.name}"
  vpc_id = "{var.vpc_id}"
  tags   = "${merge(var.default_tags, var.tags, map("Name", "${var.name}-priv"))}"
}
