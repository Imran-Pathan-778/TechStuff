terraform {

  backend "s3" {
    bucket = "terra-state-140723"
    key    = "terraform/backend"
    region = "ap-south-1"

  }
}
