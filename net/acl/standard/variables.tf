variable "vpc_id" {
  type        = "string"
  description = "Your VPC ID"
  default     = "default_value"
}

variable "name" {
  description = "Environment Name"
}

variable "pub_subnet_ids" {
  type = "list"
}

variable "priv_subnet_ids" {
  type = "list"
}

variable "pub_inbound" {
  default = []
}

variable "priv_inbound" {
  default = []
}

variable "def_priv_inbound_rules" {
  default = [
    "100|all|0|0|0.0.0.0/0",
  ]
}

variable "def_pub_inbound_rules" {
  default = [
    "100|tcp|80|80|0.0.0.0/0",
    "110|tcp|443|443|0.0.0.0/0",
    "120|tcp|1024|65535|0.0.0.0/0",
    "130|udp|1024|65535|0.0.0.0/0",
  ]
}

variable "pub_outbound" {
  default = []
}

variable "priv_outbound" {
  default = []
}

variable "def_priv_outbound_rules" {
  default = [
    "100|all|0|0|0.0.0.0/0",
  ]
}

variable "def_pub_outbound_rules" {
  default = [
    "100|all|0|0|0.0.0.0/0",
  ]
}

variable "default_tags" {
  description = "Default tags"
  type        = "map"

  default = {
    terraform = "net/acl/standard"
    Owner     = "csg"
  }
}

variable "tags" {
  description = "Tag overrides"
  type        = "map"
  default     = {}
}
