variable "subnets" {
  description = "List of subnet IDs for EC2 instances"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "security_groups" {
  description = "Security groups to associate with EC2 instances"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where the EC2 instances will be launched"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g. dev, prod)"
  type        = string
}
