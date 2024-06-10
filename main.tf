module "vpc" {
  source          = "/home/ubuntu/terraform/module/vpc"
  vpc_cidr_block  = var.vpc_cidr_block
  vpc_tags        = var.vpc_tags
}

module "public_subnets" {
  source                    = "/home/ubuntu/terraform/module/subnetPublic"
  vpc_id                    = module.vpc.vpc_id
  public_subnet_cidr_blocks = var.public_subnet_cidr_blocks
  public_azs                = var.public_azs
  public_subnet_tags        = var.public_subnet_tags
}

module "private_subnets" {
  source                     = "/home/ubuntu/terraform/module/subnetPrivate"
  vpc_id                     = module.vpc.vpc_id
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  private_azs                = var.private_azs
  private_subnet_tags        = var.private_subnet_tags
}

module "security_group_lb" {
  source                        = "/home/ubuntu/terraform/module/securityLB"
  lb_security_group_name        = var.lb_security_group_name
  lb_security_group_description = var.lb_security_group_description
  vpc_id                        = module.vpc.vpc_id
  exposed_ports                 = var.exposed_ports
}

module "load_balancer" {
  source                           = "/home/ubuntu/terraform/module/load-balancer"
  lb_name                          = var.lb_name
  lb_internal                      = var.lb_internal
  lb_type                          = var.lb_type
  securityGroupLB_id               = module.security_group_lb.securityGroupLB_id
  lb_subnets                       = module.public_subnets.public_subnet_ids_list
  vpc_id                           = module.vpc.vpc_id
# Targe gropup
  target_group_name                = var.target_group_name
  target_group_port                = var.target_group_port
  target_group_protocol            = var.target_group_protocol
  health_check_path                = var.health_check_path
  health_check_port                = var.health_check_port
  health_check_protocol            = var.health_check_protocol
  health_check_timeout             = var.health_check_timeout
  health_check_interval            = var.health_check_interval
  health_check_healthy_threshold   = var.health_check_healthy_threshold
  health_check_unhealthy_threshold = var.health_check_unhealthy_threshold
  tags                             = var.tags
#Listener
  listener_port                    = var.listener_port
  listener_protocol                = var.listener_protocol
}
