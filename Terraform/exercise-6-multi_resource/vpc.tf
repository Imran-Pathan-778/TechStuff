resource "aws_vpc" "terravpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "terravpc"
  }
}

resource "aws_subnet" "terravpc-pub-1" {
  vpc_id                  = aws_vpc.terravpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "terravpc-pub-1"
  }
}

resource "aws_subnet" "terravpc-pub-2" {
  vpc_id                  = aws_vpc.terravpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "terravpc-pub-2"
  }
}

resource "aws_subnet" "terravpc-pub-3" {
  vpc_id                  = aws_vpc.terravpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "terravpc-pub-3"
  }
}

resource "aws_subnet" "terravpc-priv-1" {
  vpc_id                  = aws_vpc.terravpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "terravpc-priv-1"
  }
}

resource "aws_subnet" "terravpc-priv-2" {
  vpc_id                  = aws_vpc.terravpc.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "terravpc-priv-2"
  }
}

resource "aws_subnet" "terravpc-priv-3" {
  vpc_id                  = aws_vpc.terravpc.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "terravpc-priv-3"
  }
}

resource "aws_internet_gateway" "terravpc-IGW" {
  vpc_id = aws_vpc.terravpc.id

  tags = {
    Name = "terravpc-IGW"
  }
}

resource "aws_route_table" "terravpc-pub-RT" {
  vpc_id = aws_vpc.terravpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terravpc-IGW.id
  }

  tags = {
    Name = "terravpc-pub-RT"
  }
}

resource "aws_route_table_association" "terravpc-pub-RT-1-a" {
  subnet_id      = aws_subnet.terravpc-pub-1.id
  route_table_id = aws_route_table.terravpc-pub-RT.id
}

resource "aws_route_table_association" "terravpc-pub-RT-2-a" {
  subnet_id      = aws_subnet.terravpc-pub-2.id
  route_table_id = aws_route_table.terravpc-pub-RT.id
}

resource "aws_route_table_association" "terravpc-pub-RT-3-a" {
  subnet_id      = aws_subnet.terravpc-pub-3.id
  route_table_id = aws_route_table.terravpc-pub-RT.id
}