module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "19.20.0"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnets         = module.vpc.private_subnets

  tags = {
    Name = "Jenkins-EKS"
  }

  vpc_id = module.vpc.vpc_id

  worker_groups = [
    {
      name                          = "Worker-Group"
      instance_type                 = "t2.micro"
      asg_desired_capacity          = 1
      additional_security_group_ids = [aws_security_group.security_group.id]
    }
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}