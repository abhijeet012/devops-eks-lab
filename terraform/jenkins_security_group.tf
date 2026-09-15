resource "aws_security_group" "jenkins_security_group" {
  name        = "devops-jenkins-sg"
  description = "security group for jenkins server"
  vpc_id      = aws_vpc.eks_vpc.id

  ingress {
    description = "SSh from admin machine"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["45.153.90.1/32"]
  }

  ingress {
    description = "Jenkins UI from admin machine"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["45.153.90.1/32"]
  }

  ingress {
    description = "Jenkins UI from Windows admin"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["203.145.57.114/32"]
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "devops-jenkins-sg"
  }
}

