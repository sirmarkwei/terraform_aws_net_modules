variable "peering_id" {
  type        = "string"
  description = "VPC Peering Connection ID"
}

variable "requester_cidr" {
  type        = "string"
  description = "CIDR block for requesting VPC"
}

variable "requester_name" {
  type        = "string"
  description = "Name of requesting VPC"
}

variable "accepter_rts" {
  type        = "list"
  description = "Accepters Route Tables"
}

variable "default_tags" {
  description = "Default tags"
  type        = "map"

  default = {
    terraform = "net/peering/accept"
    Owner     = "csg"
  }
}

variable "tags" {
  description = "Tag overrides"
  type        = "map"
  default     = {}
}
