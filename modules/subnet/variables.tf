variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
}

variable "web_subnet_cidr" {
  description = "Web subnet CIDR blocks"
  type        = list(string)
}

variable "app_subnet_cidr" {
  description = "App subnet CIDR blocks"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}
variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

# variable "public_subnets" {
#   description = "List of public subnet IDs"
#   type        = list(string)
# }
variable "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  type        = string
}