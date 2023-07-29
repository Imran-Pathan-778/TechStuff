provider "aws" {
  region = "ap-south-1"
  #	access_key = ""
  #	secret_key = ""
}

resource "aws_instance" "intro" {

  ami                    = "ami-057752b3f1d6c4d6c"
  instance_type          = "t2.micro"
  availability_zone      = "ap-south-1a"
  key_name               = "TerraKeyPair"
  vpc_security_group_ids = ["sg-0f65928fb82d75ca8"]
  tags = {
    Name = "TestTerraInstance"
    Project = "New"
  }
}
