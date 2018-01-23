# ACL Setup Module
This module provides a simple wrapper to setup Public and Private Network ACLs and attach them to your subnets. This will create:

* Public Newtwork ACL (Inbound allow tcp 80/443/1024-65535 and ICMP)
* Private Network ACL (Allow all inbound and outbound)
* Associate ACLs to Public or Private Subnets

## Usage

**Create Public / Private Network ACLs**
```
module "YOUR_ENV_prod_standard_acls" {
  source = "<WHERE THE MODULE LIVES IN GIT>git::https://github.com/sirmarkwei/terraform_aws_net_modules.git//net/acl/standard"
  vpc_id = "<YOUR VPC ID HERE>"
  name = "<WHAT YOU WANT TO NAME THE ACL>"
  pub_subnet_ids = ["subnet-1234567", "subnet-98746541", "subnet-abcefgh"]
  priv_subnet_ids = ["subnet-zxywv99", "subnet-246810a", "subnet-lmnopqrs"]
  /* Enter ACL rules in the format "protocol|starting port|ending port|cidr range"*/
  /* Note on protocols, only use the words "tcp, udp, ah, all"*/
  pub_inbound = [
    "tcp|22|22|1.2.3.4/24",
    "tcp|21|21|9.8.7.6/24",
    "tcp|8080|8080|0.0.0.0/0",
  ]
  priv_inbound = []
  /*Optional Outbound as well -- Uncommon*/
  pub_outbound = []
  priv_outbound = []
  tags = {
    bu = "labs"
    env = "shared"
  }
}
```
