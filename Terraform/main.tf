locals {
  services_data = jsondecode(file(var.services_file))
  services      = local.services_data.services
}

module "vpc" {
  source = "./modules/vpc"
}

module "eks" {
  source       = "./modules/eks"
  cluster_name = var.cluster_name
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.private_subnet_ids
}

module "ecr" {
  source   = "./modules/ecr"
  for_each = toset(local.services)
  name     = each.key
}

resource "aws_iam_role_policy_attachment" "eks_ecr" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.eks.node_role_name
}