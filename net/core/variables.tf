// Resource agnostic variables (referenced by multiple resource objects)

variable "cidr" {
  description = "Desired CIDR block of VPC"
}

variable "name" {
  description = "Name of resource"
}

variable "default_tags" {
  description = "Set of required tags for all AWS objects."
  type        = "map"

  default = {
    terraform = "net/core"
    Owner     = "csg"
  }
}

variable "tags" {
  description = "Tag overrides"
  type        = "map"
  default     = {}
}
