output "instance_id" {
  value       = aws_instance.this.id
  description = "Instance ID"
}

output "security_group_id" {
  value       = aws_security_group.this.id
  description = "Security group ID"
}

output "role" {
  value       = aws_iam_role.this.name
  description = "Name of AWS IAM Role associated with the instance"
}

output "public_ip" {
  value       = aws_instance.this.public_ip
  description = "Public IP of the instance (or EIP)"
}

output "private_ip" {
  value       = aws_instance.this.private_ip
  description = "Private IP of the instance"
}