variable "subnet_id" {
  description = "Create NGW in this public subnet."
  type        = "string"
}

variable "route_table_id" {
  description = "Add ngw to this route table"
}
