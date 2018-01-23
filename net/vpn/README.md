# VPN Module
This module provides a simple wrapper to stand up the AWS components required for a VPN connection to a remote on-prem datacenter. This will create:

* Customer Gateway
* VPN Connection
* Associate Routes to created VPN Connection Object

## Usage
### Note target ip variable passed below is for the far end gateway you want to stand up connection with.

**Create a VPN Connection**
```
module "SOME_OFFICE_vpn" {
  source = "<WHERE THE MODULE LIVES IN GIT>git::https://github.com/sirmarkwei/terraform_aws_net_modules.git//net/vpn"
  target_ip = "1.2.3.4"
  vgw_id = "vgw-1235ABCE"
  remote_name = "REMOTE_OFFICE_NAME`"
  routes = [ "10.0.0.0/16", "10.1.0.0/16", "192.168.168.0/24" ]
  public_route_table_id = "rtb-12345678"
  private_route_table_id = "rtb-98745431"
  tags = {
    bu = ""
    env = ""
  }
}
