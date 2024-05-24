resource "aws_subnet" "public_subnets" {
  count             = length(var.subnet_cidr_blocks)
  vpc_id            = var.vpc_id
  cidr_block        = element(var.subnet_cidr_blocks, count.index)
  availability_zone = element(var.azs, count.index)
  
  tags = merge(var.subnet_tags, {
    Name = "Public Subnet ${count.index + 1}"
  })
}
