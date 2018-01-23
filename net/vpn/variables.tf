variable "target_ip" {
  type        = "string"
  description = "Customer Gateway IP. IP of the the far end firewall"
}

variable "vgw_id" {
  type        = "string"
  description = "VGW ID"
}

variable "routes" {
  type        = "list"
  description = "Routes at the far end"
}

variable "private_route_table_id" {
  type        = "string"
  description = "Private Route Table ID"
  default     = ""
}

variable "public_route_table_id" {
  type        = "string"
  description = "Private Route Table ID"
  default     = ""
}

variable "remote_name" {
  type        = "string"
  description = "Name of the far end gateway"
}

variable "default_tags" {
  description = "Set of required tags for all AWS objects."
  type        = "map"

  default = {
    terraform = "net/vpn"
    Owner     = "csg"
  }
}

variable "tags" {
  description = "Tag overrides"
  type        = "map"
  default     = {}
}
