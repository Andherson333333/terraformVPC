# Creación del Security Group para las instancias EC2
resource "aws_security_group" "instancia_ec2" {
  name        = var.ec2_security_group_name
  description = var.ec2_security_group_description
  vpc_id      = var.vpc_id
}

# Ingress rule para los puertos expuestos
resource "aws_security_group_rule" "ec2_exposed_ports" {
  count             = length(var.exposed_ports_ec2)
  type              = "ingress"
  from_port         = var.exposed_ports_ec2[count.index]
  to_port           = var.exposed_ports_ec2[count.index]
  protocol          = "tcp"
  source_security_group_id = var.securityGroupLB_id
  security_group_id        = aws_security_group.instancia_ec2.id
}

# Egress rule para permitir todo
resource "aws_security_group_rule" "ec2_allow_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id   = aws_security_group.instancia_ec2.id
}

