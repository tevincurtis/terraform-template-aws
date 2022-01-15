# Configuration section for public subnet
resource "aws_subnet" "public_apse1_0" {
  cidr_block        = cidrsubnet("10.0.0.0/16", 6, 0)
  vpc_id            = aws_vpc.apse1_0.id
  availability_zone = var.availability_zone[0]

  tags = {
    Name = "public-apse1-0"
  }
}

resource "aws_subnet" "public_apse1_1" {
  cidr_block        = cidrsubnet("10.0.0.0/16", 6, 1)
  vpc_id            = aws_vpc.apse1_0.id
  availability_zone = var.availability_zone[1]

  tags = {
    Name = "public-apse1-1"
  }
}

resource "aws_subnet" "public_apse1_2" {
  cidr_block        = cidrsubnet("10.0.0.0/16", 6, 2)
  vpc_id            = aws_vpc.apse1_0.id
  availability_zone = var.availability_zone[2]

  tags = {
    Name = "public-apse1-2"
  }
}

# Configuration section for route table public_apse1_0
resource "aws_route_table" "public_apse1_0" {
  vpc_id = aws_vpc.apse1_0.id

  tags = {
    Name = "public-apse1-0"
  }
}

resource "aws_route" "default_public_apse1_0" {
  route_table_id         = aws_route_table.public_apse1_0.id
  destination_cidr_block = var.default_route
  gateway_id             = aws_internet_gateway.apse1_0.id
}

resource "aws_route_table_association" "public_apse1_0" {
  subnet_id      = aws_subnet.public_apse1_0.id
  route_table_id = aws_route_table.public_apse1_0.id
}

# Configuration section for route table public_apse1_1
resource "aws_route_table" "public_apse1_1" {
  vpc_id = aws_vpc.apse1_0.id

  tags = {
    Name = "public-apse1-1"
  }
}

resource "aws_route" "default_public_apse1_1" {
  route_table_id         = aws_route_table.public_apse1_1.id
  destination_cidr_block = var.default_route
  gateway_id             = aws_internet_gateway.apse1_0.id
}

resource "aws_route_table_association" "public_apse1_1" {
  subnet_id      = aws_subnet.public_apse1_1.id
  route_table_id = aws_route_table.public_apse1_1.id
}

# Configuration section for route table public_apse1_2
resource "aws_route_table" "public_apse1_2" {
  vpc_id = aws_vpc.apse1_0.id

  tags = {
    Name = "public-apse1-2"
  }
}

resource "aws_route" "default_public_apse1_2" {
  route_table_id         = aws_route_table.public_apse1_2.id
  destination_cidr_block = var.default_route
  gateway_id             = aws_internet_gateway.apse1_0.id
}

resource "aws_route_table_association" "public_apse1_2" {
  subnet_id      = aws_subnet.public_apse1_2.id
  route_table_id = aws_route_table.public_apse1_2.id
}
