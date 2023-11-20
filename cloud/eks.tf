module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  eks_managed_node_groups = {
    first = {
      name = "node-group-1"

      instance_type = "t3.micro"

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }

  aws_auth_roles = [
    {
      rolearn  = "arn:aws:iam::904204212286:user/terraform"
      username = "terraform"
      groups   = ["system:masters"]
    },
  ]

  tags = {
    Name = "Jenkins-EKS"
  }
}
