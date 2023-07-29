resource "aws_instance" "intro-var" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "terra-new-SG"
  vpc_security_group_ids = ["sg-0f65928fb82d75ca8"]
  tags = {
    Name    = "TestTerraInstance"
    Project = "New"
  }
}
