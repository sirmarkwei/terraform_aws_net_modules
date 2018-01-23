# VPC Module - Peering Request
This module provides a simple wrapper to stand up the requester side of the VPC Peering between two VPC's in different accounts:

* VPC Peering Connection - Request

## Usage

**Create a VPC Peering Request**
```
module "labs_net_peering_request" {
  source = "<WHERE THE MODULE LIVES IN GIT>git::https://github.com/sirmarkwei/terraform_aws_net_modules.git//net/peering/request"
  requester_vpc_id = "vpc-123456789"
  accepter_vpc_id = "vpc-987654321"
  accepter_account = "12345678910"
  accepter_cidr = "1.2.3.0/16"
  accepter_name = "YOUR_ENV"
  requester_rt = ["rtb-123456", "rtb-654321", "rtb-ABCDEFG"]
  tags = {
    bu = ""
    env = ""
  }
}


```
