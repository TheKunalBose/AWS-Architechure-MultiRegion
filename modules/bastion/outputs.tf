output "bastion_ids" {
  description = "List of Bastion instance IDs"
  value       = aws_instance.bastion[*].id
}
