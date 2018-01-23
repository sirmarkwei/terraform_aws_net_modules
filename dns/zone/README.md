# VPC Module - Create a private Route 53 Zone and associate with VPC
This module creates a new inernal DNS zone hosted on Route 53:

* Create Private Route 53 Zone

## Usage

**Create a Route53 Zone**
```
module "labs_route53_createzone" {
  source = "<WHERE THE MODULE LIVES IN GIT>git::https://github.com/sirmarkwei/terraform_aws_net_modules.git//dns/create"
  name = "<YOUR DNS ZONE NAME>"
  vpc_id = "<YOUR VPC HERE>"
  tags = {
    bu = "<IF YOU WANT>"
    env = "<IF YOU WANT>"
  }
}


```
