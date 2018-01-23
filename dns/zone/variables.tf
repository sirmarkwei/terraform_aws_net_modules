variable "name" {
  type        = "string"
  description = "Your DNS domain"
}

variable "vpc_id" {
  type        = "string"
  description = "The ID of the VPC"
}

variable "default_tags" {
  description = "Default tags"
  type        = "map"

  default = {
    terraform = "route53/create"
    Owner     = "csg"
  }
}

variable "tags" {
  description = "Tag overrides"
  type        = "map"
  default     = {}
}
