output "elb_arn" {
  description = "ELB ARN"
  value       = aws_lb.elb.arn
}

output "elb_dns" {
  description = "ELB DNS Name"
  value       = aws_lb.elb.dns_name
}
