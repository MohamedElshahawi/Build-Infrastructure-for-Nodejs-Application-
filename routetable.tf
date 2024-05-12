resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.sh_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sh_gw.id
  }

  tags = {
    Name = "Public Route Table"
  }
}



resource "aws_route_table_association" "public_rta1" {
  subnet_id      = aws_subnet.sh_subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_rta2" {
  subnet_id      = aws_subnet.sh_subnet2.id
  route_table_id = aws_route_table.public_route_table.id
}



resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.sh_vpc.id

  tags = {
    Name = "Private Route Table"
  }
}


resource "aws_route_table_association" "private_rta1" {
  subnet_id      = aws_subnet.sh_subnet3.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_rta2" {
  subnet_id      = aws_subnet.sh_subnet4.id
  route_table_id = aws_route_table.private_route_table.id
}
