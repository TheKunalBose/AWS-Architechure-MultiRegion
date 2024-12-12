variable "domain_name" {
  description = "Domain name for Route53"
  type        = string
}

variable "elb_record_name" {
  description = "Record name for ELB"
  type        = string
}

variable "elb_dns_name" {
  description = "ELB DNS name"
  type        = string
}

variable "elb_zone_id" {
  description = "ELB Zone ID"
  type        = string
}
