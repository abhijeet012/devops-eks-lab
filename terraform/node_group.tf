resource "aws_eks_node_group" "devops_eks_node_group" {
  cluster_name    = aws_eks_cluster.devops_eks_cluster.name
  node_group_name = "devops-eks-node-group"
  node_role_arn   = aws_iam_role.eks_node_role.arn

  subnet_ids = [
    aws_subnet.eks_public_subnet_a.id,
    aws_subnet.eks_public_subnet_b.id
  ]

  instance_types = ["t3.small"]

  scaling_config {
    desired_size = 2
    min_size     = 2
    max_size     = 2
  }

  tags = {
    Name = "devops-eks-worker-nodes"
  }
}
