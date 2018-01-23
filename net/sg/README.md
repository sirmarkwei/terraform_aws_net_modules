# Security Group module

This module provides a simple wrapper around creating AWS Security Groups.

## Usage

Legend:

Core ways to manage SG module call (only required to use one of any type, however you can use all if needed for a SG), format below:
**cidr_rule_set**  = "`direction`|`protocol`|`starting port`|`ending port`|`CIDR Block`"

**sg_rule_set** format = "`direction`|`protocol`|`starting port`|`ending port`|`SG Group ID`"

**self_rule_set** format = "`direction`|`protocol`|`starting port`|`ending port`"

**allow_def_outbound** = false by default, change to true if you don't want to customize outbound rulesets

If protocol not `icmp`, `tcp`, `udp`, or `all` use the [protocol number](https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml)

## Examples
**Create a security group (do not include self):**
* Allow a few ports inbound/outbound with CIDR blocks
* Allow a few ports inbound/outbound with SG Group IDs

```
module "sg_all_tcp_3306" {
  source = "<WHERE THE MODULE LIVES IN GIT>git::https://github.com/sirmarkwei/terraform_aws_net_modules.git//net/sg"

  name = "appy-tcp-ssh-msql"
  vpc_id = "vpc-123456789"
  sg_description = "This SG allows tcp 22,3306,80,443 and ICMP for application Y"
  cidr_rule_set = [
  "ingress|icmp|0|8|0.0.0.0/0",
  "ingress|tcp|22|22|10.1.2.0/23",
  "ingress|tcp|3306|3306|10.1.2.0/23",
  "egress|tcp|80|80|0.0.0.0/0",
  "egress|tcp|443|443|0.0.0.0/0",
  ]
  sg_rule_set = [
  "ingress|tcp|21|21|sg-123456",
  "ingress|tcp|636|636|sg-987654",
  "ingress|udp|53|53|sg-987654",
  "egress|udp|53|53|sg-123456",
  ]
  tags = {
    bu = "foo"
    env = "prod"
  }
}
```

**Create a security group (with a self rule):**
* Allow a few ports inbound/outbound with the self rule
* Also employ the allow_def_outbound rule

```
module "tcp-allow-3306-self" {
  source = "<WHERE THE MODULE LIVES IN GIT>git::https://github.com/sirmarkwei/terraform_aws_net_modules.git//net/sg"

  name = "appx-tcp-ftp"
  vpc_id = "vpc-123456789"
  sg_description = "This SG allows tcp 21 and 22 from group members for application X"
  self_rule_set = [
  "ingress|tcp|21|21",
  "ingress|tcp|22|22",
  ]
  allow_def_outbound = true
  tags = {
    bu = "foo"
    env = "prod"
  }
}
```
