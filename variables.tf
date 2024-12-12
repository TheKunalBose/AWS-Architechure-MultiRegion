# AWS Region
variable "region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-east-1"
}

# Environment name 
variable "environment" {
  description = "The environment name (e.g., dev, prod)."
  type        = string
  default     = "dev"
}

# VPC CIDR block
variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

# Public Subnet CIDR blocks
variable "public_subnet_cidr" {
  description = "List of CIDR blocks for public subnets."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

# Web Subnet CIDR blocks
variable "web_subnet_cidr" {
  description = "List of CIDR blocks for web subnets."
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

# Application Subnet CIDR blocks
variable "app_subnet_cidr" {
  description = "List of CIDR blocks for app subnets."
  type        = list(string)
  default     = ["10.0.5.0/24", "10.0.6.0/24"]
}

# Availability Zones
variable "availability_zones" {
  description = "List of availability zones for resources."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

# EC2 Instance Type
variable "instance_type" {
  description = "Instance type for EC2 instances."
  type        = string
  default     = "t2.micro"  
}

# AMI ID for EC2 Instances
variable "ami_id" {
  description = "AMI ID for EC2 instances."
  type        = string
  default     = "ami-007868005aea67c54"  
}

# Security Groups for the Load Balancer
variable "elb_security_groups" {
  description = "Security groups for the Elastic Load Balancer."
  type        = list(string)
  default     = ["sg-0a3c46c65b683021e"] 
}

# Security Groups for EC2 Instances
variable "ec2_security_groups" {
  description = "Security groups for EC2 instances."
  type        = list(string)
  default     = [] 
}

# Enable NAT Gateway (Optional)
variable "nat_gateway_enabled" {
  description = "Flag to enable or disable the NAT Gateway."
  type        = bool
  default     = true
}

# Enable Route 53 (Optional)
variable "route53_enabled" {
  description = "Flag to enable or disable Route 53 module."
  type        = bool
  default     = false
}
