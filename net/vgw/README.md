# VGW Module
This module provides a simple wrapper to stand up the AWS Component: Virtual Private Gateway

* Virtual Private Gateway

## Usage

**Create a Virutal Private Gateway**
```
module "labs_vgw" {
  source = "<WHERE THE MODULE LIVES IN GIT>git::https://github.com/sirmarkwei/terraform_aws_net_modules.git//net/vgw"
  vpc_id = "vpc-123456789"
  vpc_name = "labs-prod-use1"
  tags = {
    bu = ""
    env = ""
  }
}
