# Public Subnets
resource "aws_subnet" "sh_subnet1" {
  vpc_id            = aws_vpc.sh_vpc.id
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-north-1a"

  tags = {
    Name = "Public Subnet 1"
  }
}

resource "aws_subnet" "sh_subnet2" {
  vpc_id            = aws_vpc.sh_vpc.id
  cidr_block        = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-north-1b"

  tags = {
    Name = "Public Subnet 2"
  }
}

# Private Subnets
resource "aws_subnet" "sh_subnet3" {
  vpc_id            = aws_vpc.sh_vpc.id
  cidr_block        = "10.0.3.0/24"
  map_public_ip_on_launch = false
  availability_zone = "eu-north-1a"

  tags = {
    Name = "Private Subnet 1"
  }
}

resource "aws_subnet" "sh_subnet4" {
  vpc_id            = aws_vpc.sh_vpc.id
  cidr_block        = "10.0.4.0/24"
  map_public_ip_on_launch = false
  availability_zone = "eu-north-1b"

  tags = {
    Name = "Private Subnet 2"
  }
}
