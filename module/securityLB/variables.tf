variable "lb_security_group_name" {
  description = "Nombre del security group para el load balancer"
  type        = string
}

variable "lb_security_group_description" {
  description = "Descripción del security group para el load balancer"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC donde se creará el security group"
  type        = string
}

variable "exposed_ports" {
  description = "Puertos expuestos por el load balancer"
  type        = list(number)
}
