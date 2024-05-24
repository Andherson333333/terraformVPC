module "vpc" {
  source          = "/home/ubuntu/terraform/module/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  vpc_tags       = var.vpc_tags
}

module "subnets" {
  source = "/home/ubuntu/terraform/module/subnet"

  vpc_id            = module.vpc.vpc_id
  subnet_cidr_blocks = var.subnet_cidr_blocks
  azs                = var.azs
  subnet_tags        = var.subnet_tags
}
