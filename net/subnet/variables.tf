variable "name" {
  description = "Subnet name"
}

variable "vpc_id" {
  description = "VPC identifier"
}

variable "cidr_block" {
  description = "CIDR block of new subnet"
}

variable "route_table_id" {
  description = "Associate subnet with this route table"
}

variable "availability_zone" {
  description = "Availability zone to create subnet in"
}

variable "private" {
  description = "Create private subnet"
  default     = false
}

variable "default_tags" {
  description = "Default tags"
  type        = "map"

  default = {
    terraform = "net/subnet"
    Owner     = "csg"
  }
}

variable "tags" {
  description = "Tag overrides"
  type        = "map"
  default     = {}
}
