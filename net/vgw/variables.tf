# Resource agnostic variables (referenced by multiple resource objects)

variable "vpc_id" {
  type        = "string"
  description = "Your VPC ID"
}

variable "vpc_name" {
  type        = "string"
  description = "Name of your VPC"
}

variable "default_tags" {
  description = "Set of required tags for all AWS objects."
  type        = "map"

  default = {
    terraform = "net/vgw"
    Owner     = "csg"
  }
}

variable "tags" {
  description = "Tag overrides"
  type        = "map"
  default     = {}
}
