output "securityGroupLB_id" {
  description = "ID del security group creado para el load balancer"
  value       = aws_security_group.lb-http-conection.id
}
