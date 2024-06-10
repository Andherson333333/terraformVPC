output "target_group_id" {
  description = "ID del grupo de destino creado"
  value       = aws_lb_target_group.target_group.id
}

# Listener

output "load_balancer_arn" {
  description = "ARN del load balancer creado"
  value       = aws_lb.load-balancer.arn
}

output "target_group_arn" {
  description = "ARN del grupo de destino creado"
  value       = aws_lb_target_group.target_group.arn
}

output "listener_arn" {
  description = "ARN del listener creado"
  value       = aws_lb_listener.listener.arn
}

