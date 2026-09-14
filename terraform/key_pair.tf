resource "aws_key_pair" "ansible_lab_key" {
  key_name   = "ansible-lab-key"
  public_key = file("~/.ssh/ansible-lab-key.pub")

  tags = {
    Name = "ansible-lab-key"
  }
}
