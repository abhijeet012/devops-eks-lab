resource "aws_route_table" "eks_private_route_table" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    Name = "devops-eks-private-route-table"
  }
}

resource "aws_route_table_association" "private_subnet_a_association" {
  subnet_id      = aws_subnet.eks_private_subnet_a.id
  route_table_id = aws_route_table.eks_private_route_table.id
}

resource "aws_route_table_association" "private_subnet_b_association" {
  subnet_id      = aws_subnet.eks_private_subnet_b.id
  route_table_id = aws_route_table.eks_private_route_table.id
}
