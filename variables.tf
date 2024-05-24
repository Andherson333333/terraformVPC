variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_tags" {
  description = "Tags for the VPC"
  type        = map(string)
}

variable "subnet_cidr_blocks" {
  description = "CIDR blocks for the subnets"
  type        = list(string)
}

variable "azs" {
  description = "Availability Zones for the subnets"
  type        = list(string)
}

variable "subnet_tags" {
  description = "Tags for the subnets"
  type        = map(string)
}
