resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "${var.env}-vpc"
  }
}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.env}-internet_gateway"
  }
}

resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnet_cidr)
  vpc_id = aws_vpc.vpc.id
  availability_zone = element(var.az,count.index)
  cidr_block = element(var.public_subnet_cidr,count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.env}-public_subnet-${count.index+1}"
    type = var.type1
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_subnet_cidr
  map_public_ip_on_launch = false 
  tags = {
    Name = "${var.env}-private_subnet"
    type = var.type2
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.env}-public_rt"
  }
}

resource "aws_route" "public_ig" {
  route_table_id = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.ig.id
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.env}-private_rt"
  }
}

resource "aws_route_table_association" "public_sub" {
  count = length(var.public_subnet_cidr)
  subnet_id = element(aws_subnet.public_subnet.*.id,count.index)
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_sub" {
  subnet_id = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

