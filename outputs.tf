output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "Public subnet IDs"
  value       = module.subnet.public_subnets
}

output "web_subnets" {
  description = "Web subnet IDs"
  value       = module.subnet.web_subnets
}

output "app_subnets" {
  description = "App subnet IDs"
  value       = module.subnet.app_subnets
}
