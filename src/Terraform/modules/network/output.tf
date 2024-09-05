output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.heart_harmony.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.public.id
}

output "rds_subnet_group_name" {
  description = "The name of the database subnet group"
  value       = aws_db_subnet_group.rds.name
}