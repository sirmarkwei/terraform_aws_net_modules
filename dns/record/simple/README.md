# VPC Module - Route53 - Add simple record
This module provides a simple wrapper to add a simple DNS record:

* Add simple DNS record

## Usage

**Add simple DNS record**
```
module "labs_prod_add_record" {
  source = "<WHERE THE MODULE LIVES IN GIT>git::https://github.com/sirmarkwei/terraform_aws_net_modules.git//dns/record/simple"
  zone_id = "<THE AWS ROUTE53 ZONE ID HASH>"
  record_name = www
  record_type = A
  ttl = 30
  records = ["1.2.3.4", "5.6.7.8", "${var.aws_eip.example.public_ip}"]
  tags = {
    bu = "<IF YOU WANT>"
    env = "<IF YOU WANT>"
  }
}


```
