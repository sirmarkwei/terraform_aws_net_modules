# Subnet module

This module provides a simple wrapper around the `aws_subnet` resource.

## Usage

**Create a public subnet:**
```
module "subnet_pub" {
  source = "<WHERE THE MODULE LIVES IN GIT>git::https://github.com/sirmarkwei/terraform_aws_net_modules.git//net/subnet"

  name = "foo_public"
  vpc_id = "vpc-123456789"
  route_table_id = "rt-123456789"
  cidr_block = "10.1.2.3/20"
  availability_zone = "us-east-1a"
  tags = {
    bu = "foo"
    env = "prod"
  }
}
```

**Create a private subnet:**
```
module "subnet_priv" {
  source = "<WHERE THE MODULE LIVES IN GIT>git::https://github.com/sirmarkwei/terraform_aws_net_modules.git//net/subnet"

  name = "foo_private"
  vpc_id = "vpc-123456789"
  route_table_id = "rt-987654321"
  cidr_block = "10.2.3.4/20"
  availability_zone = "us-east-1a"
  private = true
  tags = {
    bu = "foo"
    env = "prod"
  }
}
```
