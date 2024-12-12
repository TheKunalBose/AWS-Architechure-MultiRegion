variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "security_groups" {
  description = "Security groups to associate with ELB"
  type        = list(string)
}
