variable "requester_vpc_id" {
  type        = "string"
  description = "The VPC ID of your own VPC. The Requester."
}

variable "accepter_vpc_id" {
  type        = "string"
  description = "The VPC ID of the Peer you are connection to. The Accepter"
}

variable "accepter_account" {
  type        = "string"
  description = "Accepter Account ID"
}

variable "accepter_cidr" {
  type        = "string"
  description = "CIDR block for peer VPC"
}

variable "accepter_name" {
  type        = "string"
  description = "Name of peer VPC"
}

variable "requester_rts" {
  type        = "list"
  description = "List of requester route tables you want to add route to"
}

variable "default_tags" {
  description = "Default tags"
  type        = "map"

  default = {
    terraform = "net/peering/request"
    Owner     = "csg"
  }
}

variable "tags" {
  description = "Tag overrides"
  type        = "map"
  default     = {}
}
