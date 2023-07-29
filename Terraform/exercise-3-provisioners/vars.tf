variable "REGION" {
  default = "ap-south-1"
}

variable "ZONE1" {
  default = "ap-south-1a"
}

variable "AMIS" {
  type = map(any)
  default = {
    ap-south-1 = "ami-057752b3f1d6c4d6c"
    us-west-2  = "ami-03f65b8614a860c29"
  }
}

variable "USER" {
  default = "ec2-user"
}