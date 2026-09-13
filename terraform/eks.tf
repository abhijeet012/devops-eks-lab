resource "aws_eks_cluster" "devops_eks_cluster" {
  name     = "devops-eks-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.eks_public_subnet_a.id,
      aws_subnet.eks_public_subnet_b.id,
      aws_subnet.eks_private_subnet_a.id,
      aws_subnet.ek_private_subnet_b.id
    ]

    endpoint_public_access  = true
    endpoint_private_access = false
  }

  access_config {
    authentication_mode = "API_AND_CONFIG_MAP"
  }

  tags = {
    Name = "devops-eks-cluster"
  }
}

resource "aws_eks_access_entry" "eksuser_access" {
  cluster_name  = aws_eks_cluster.devops_eks_cluster.name
  principal_arn = "arn:aws:iam::128325659234:user/eksuser"

  type = "STANDARD"
}

resource "aws_eks_access_policy_association" "eksuser_admin_access" {
  cluster_name  = aws_eks_cluster.devops_eks_cluster.name
  principal_arn = aws_eks_access_entry.eksuser_access.principal_arn
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }
}
