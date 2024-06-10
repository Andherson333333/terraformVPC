## LoadBalancer

variable "securityGroupLB_id" {
  description = "ID del security group para el load balancer"
  type        = string
}

variable "lb_name" {
  description = "Nombre del load balancer"
  type        = string
}

variable "lb_internal" {
  description = "Indicador interno para el load balancer"
  type        = bool
  default     = false
}

variable "lb_type" {
  description = "Tipo de load balancer (e.g., application, network)"
  type        = string
  default     = "application"
}

variable "lb_subnets" {
  description = "List of subnet IDs for the load balancer"
  type        = list(string)
}

variable "vpc_id" {  # Agregar esta variable
  description = "ID de la VPC donde se creará el grupo de destino"
  type        = string
}

## Target group

variable "target_group_name" {
  description = "Nombre del grupo de destino"
  type        = string
}

variable "target_group_port" {
  description = "Puerto en el que el grupo de destino escucha las solicitudes"
  type        = number
}

variable "target_group_protocol" {
  description = "Protocolo utilizado para la comunicación con el grupo de destino"
  type        = string
}

variable "health_check_path" {
  description = "Ruta para el chequeo de salud"
  type        = string
}

variable "health_check_port" {
  description = "Puerto para el chequeo de salud"
  type        = number
}

variable "health_check_protocol" {
  description = "Protocolo para el chequeo de salud"
  type        = string
}

variable "health_check_timeout" {
  description = "Tiempo de espera en segundos antes de marcar una comprobación como fallida"
  type        = number
}

variable "health_check_interval" {
  description = "Intervalo en segundos entre comprobaciones"
  type        = number
}

variable "health_check_healthy_threshold" {
  description = "Número de comprobaciones saludables consecutivas necesarias para considerar una instancia como saludable"
  type        = number
}

variable "health_check_unhealthy_threshold" {
  description = "Número de comprobaciones no saludables consecutivas necesarias para considerar una instancia como no saludable"
  type        = number
}

variable "tags" {
  description = "Etiquetas que se aplicarán al grupo de destino"
  type        = map(string)
}

## Listener

variable "listener_port" {
  description = "Puerto del listener"
  type        = number
}

variable "listener_protocol" {
  description = "Protocolo del listener"
  type        = string
}



