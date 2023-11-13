resource "aws_vpc" "vpc" {
  cidr = var.vpc_cidr_block
}