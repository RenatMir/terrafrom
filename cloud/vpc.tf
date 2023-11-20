locals {
  vpc_name = "Jenkins-VPC"
}

module vpc {
  source = "terraform-aws-modules/vpc/aws"

  name = local.vpc_name
  cidr = var.vpc_cidr_block

  azs             = data.aws_availability_zones.azs_available.names
  private_subnets = ["10.0.0.0/24", "10.0.1.0/24"]
  public_subnets  = ["10.0.2.0/24", "10.0.3.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  enable_dns_hostnames = true

  tags = {
    Name = local.vpc_name
  }

  public_subnet_tags = {
    Name = "EKS-Jenkins-Public-Subnet"
  }

  private_subnet_tags = {
    Name = "EKS-Jenkins-Private-Subnet"
  }
}