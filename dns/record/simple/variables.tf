variable "zone_id" {
  type        = "string"
  description = "DNS Zone ID where you want to create this record"
}

variable "record_name" {
  type        = "string"
  description = "Name of DNS record i.e. www, blog, frontend, etc"
}

variable "record_type" {
  type        = "string"
  description = "Type of DNS record; A"
}

variable "ttl" {
  type        = "string"
  description = "TTL for the record"
  default     = "300"
}

variable "records" {
  type        = "list"
  description = "String List of records"
}
