output "target_group_id" {
  description = "ID del grupo de destino creado"
  value       = aws_lb_target_group.target_group.id
}
