output "route53_zone_id" {
  description = "Route53 Zone ID"
  value       = aws_route53_zone.main.zone_id
}

output "elb_record_name" {
  description = "ELB Record Name"
  value       = aws_route53_record.elb.name
}
