variable "name" {
  description = "SG Name"
}

variable "sg_description" {
  default = "Managed by Terraform"
}

variable "vpc_id" {
  description = "VPC identifier"
}

variable "cidr_rule_set" {
  description = "Ruleset of SG Group"
  default     = []
}

variable "sg_rule_set" {
  description = "Ruleset of SG Group"
  default     = []
}

variable "self_rule_set" {
  default     = []
  description = "SG Rule parameters for a self inclusive SG Rule"
}

variable "allow_def_outbound" {
  default = "false"
}

variable "default_tags" {
  description = "Default tags"
  type        = "map"

  default = {
    terraform = "net/sg"
    Owner     = "csg"
  }
}

variable "tags" {
  description = "Tag overrides"
  type        = "map"
  default     = {}
}
