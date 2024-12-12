output "public_subnets" {
  description = "IDs of the public subnets"
  value       = aws_subnet.public[*].id
}

output "web_subnets" {
  description = "IDs of the web subnets"
  value       = aws_subnet.web[*].id
}

output "app_subnets" {
  description = "IDs of the app subnets"
  value       = aws_subnet.app[*].id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = aws_subnet.public[*].id
}

output "web_subnet_ids" {
  description = "IDs of the web subnets"
  value       = aws_subnet.web[*].id
}

output "app_subnet_ids" {
  description = "IDs of the app subnets"
  value       = aws_subnet.app[*].id
}

output "public_subnet_cidrs" {
  description = "CIDR blocks of the public subnets"
  value       = aws_subnet.public[*].cidr_block
}

output "web_subnet_cidrs" {
  description = "CIDR blocks of the web subnets"
  value       = aws_subnet.web[*].cidr_block
}

output "app_subnet_cidrs" {
  description = "CIDR blocks of the app subnets"
  value       = aws_subnet.app[*].cidr_block
}

output "availability_zones" {
  description = "Availability zones of the public subnets"
  value       = aws_subnet.public[*].availability_zone
}
