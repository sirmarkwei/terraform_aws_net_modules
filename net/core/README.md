# Core Networking Module
This module provides a simple wrapper around several core AWS network components:

* VPC
* Lockdown Network ACLS and Assume control via Terraform
* Private/Public route tables
* Internet Gateways

## Usage

**Create a VPC**
```
module "YOUR_ENV_net_core" {
  source = "<WHERE THE MODULE LIVES IN GIT>git::https://github.com/sirmarkwei/terraform_aws_net_modules.git//net/core"
  name = "YOUR VPC NAME"
  cidr = "YOUR VPC CIDR"
  tags = {
    bu = "<IF YOU WANT>"
    env = "<IF YOU WANT>"
  }
}

```
