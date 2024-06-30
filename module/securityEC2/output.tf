output "security_groupEC2_id" {
  description = "ID del Security Group creado para instancias EC2"
  value       = aws_security_group.instancia_ec2.id
}

#output "launch_config_id" {
#  description = "ID de la Launch Configuration para instancias EC2"
#  value       = aws_launch_configuration.ec2_config.id
#}

