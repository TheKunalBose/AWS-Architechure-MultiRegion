variable "instance_type" {
  description = "The type of instance to start"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID to use for the bastion host"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}
