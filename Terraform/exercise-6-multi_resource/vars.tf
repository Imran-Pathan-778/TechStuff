variable "REGION" {
  default = "ap-south-1"
}

variable "ZONE1" {
  default = "ap-south-1a"
}

variable "ZONE2" {
  default = "ap-south-1b"
}

variable "ZONE3" {
  default = "ap-south-1c"
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

variable "PUB_KEY" {
  default = "KPterra.pub"
}

variable "PRIV_KEY" {
  default = "KPterra"
}

variable "MYIP" {
  default = "183.83.67.89/32"
}