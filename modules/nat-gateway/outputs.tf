output "nat_gateway_ids" {
  description = "NAT Gateway IDs"
  value       = aws_nat_gateway.public[*].id
}
