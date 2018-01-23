# VPC Module - Peering Accept
This module provides a simple wrapper to accept an VPC Peering request made to this BU's VPC:

* VPC Peering Connection - Accept

## Usage

**Accept a VPC Peering Request**
```
module "labs_net_peering_accept" {
  source = "<WHERE THE MODULE LIVES IN GIT>git::https://github.com/sirmarkwei/terraform_aws_net_modules.git//net/peering/accept"
  peering_id = "pcx-12345678"
  requester_cidr = "1.2.3.0/16"
  requester_name = "REQUESTER_ENV_NAME"
  accepter_rts = ["rtb-123545", "rtb-ABCDEFG", "rtb-987654321"]
  tags = {
    bu = "<IF YOU WANT>"
    env = "<IF YOU WANT>"
  }
}

```
