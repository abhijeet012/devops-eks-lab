resource "aws_instance" "jenkins_server" {
  ami                         = "ami-07dfe2c11d33a069a"
  instance_type               = "t3.small"
  subnet_id                   = aws_subnet.eks_public_subnet_a.id
  vpc_security_group_ids      = [aws_security_group.jenkins_security_group.id]
  key_name                    = aws_key_pair.ansible_lab_key.key_name
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.jenkins_instance_profile.name

  tags = {
    Name = "devops-jenkins-server"
    Role = "jenkins"
  }
}
