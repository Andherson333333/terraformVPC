# Creacion security group para loadbalancer
resource "aws_security_group" "lb-http-conection" {
  name        = var.lb_security_group_name
  description = var.lb_security_group_description 
  vpc_id      = var.vpc_id
}

# Ingress rule para los puertos expuestos
resource "aws_security_group_rule" "lb_exposed_ports" {
  count             = length(var.exposed_ports)
  type              = "ingress"
  from_port         = var.exposed_ports[count.index]
  to_port           = var.exposed_ports[count.index]
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lb-http-conection.id
}

# Egress rule para permitir todo
resource "aws_security_group_rule" "lb_allow_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lb-http-conection.id
}


