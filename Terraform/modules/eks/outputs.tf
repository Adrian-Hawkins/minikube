output "cluster_name" {
  value = aws_eks_cluster.main.name
}

output "node_role_name" {
  value = aws_iam_role.eks_nodes.name
}