# Nat module

This module provides a simple wrapper around the `aws_ngw` resource.

## Usage

**Create NAT gateway:**
```
module "nat" {
  source = "<WHERE THE MODULE LIVES IN GIT>git::https://github.com/sirmarkwei/terraform_aws_net_modules.git//net/nat"
  subnet_id = "subnet-123456789"
  route_table_id = "rt-123456789"
}
```
