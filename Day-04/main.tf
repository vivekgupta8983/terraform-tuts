locals {

  access_key = "AKIAWAY3OUANH6DHP57Z"
  secret_key = "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"

  common-tags = {
    project   = "Terraform Tutorials"
    createdBy = "Vivek Gupta"
  }
}

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = merge(local.common-tags, {
    Name = var.vpc_name,

  })
}

resource "aws_subnet" "public_subent" {
  count             = length(var.public_subnet)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.public_subnet, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = merge(local.common-tags, {
    Name = "${var.vpc_name}-public-subnet-${data.aws_availability_zones.available.names[count.index]}"
  })
}

resource "aws_subnet" "private_subnet" {
  count             = length(var.private_subnet)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.private_subnet, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "${var.vpc_name}-private-subnet-${data.aws_availability_zones.available.names[count.index]}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

resource "aws_eip" "nat_eip" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_nat_gateway" "natgw" {
  # count = length(var.public_subnet)
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subent[0].id
  tags = {
    Name = "${var.vpc_name}-nat-gw"
  }
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${var.vpc_name}-public-rt"
  }

  lifecycle {
    ignore_changes = [route]
  }
}

resource "aws_route_table_association" "a" {
  count          = length(var.public_subnet)
  subnet_id      = aws_subnet.public_subent[count.index].id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table" "private_rt" {
  count  = length(var.private_subnet)
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgw.id
  }

  tags = {
    Name = "${var.vpc_name}-private-rt-${data.aws_availability_zones.available.names[count.index]}"
  }

  lifecycle {
    ignore_changes = [route]
  }
}

resource "aws_route_table_association" "b" {
  count          = length(var.private_subnet)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_rt[count.index].id
}
