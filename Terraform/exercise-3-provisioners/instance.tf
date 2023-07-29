resource "aws_key_pair" "terra-KP" {
  key_name   = "terraKP"
  public_key = file("terraKP.pub")
}

resource "aws_instance" "terr-instance" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.terra-KP.key_name
  vpc_security_group_ids = ["sg-0f65928fb82d75ca8"]
  tags = {
    Name    = "TestTerraInstance"
    Project = "New"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {

    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]

  }

  connection {
    user        = var.USER
    private_key = file("terraKP")
    host        = self.public_ip
  }
}
