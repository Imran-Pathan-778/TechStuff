resource "aws_security_group" "terravpc_sg" {
  vpc_id      = aws_vpc.terravpc.id
  name        = "terravpc_sg"
  description = "Sec Grp for dove ssh"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYIP]
  }
  tags = {
    Name = "allow-ssh"
  }
}
