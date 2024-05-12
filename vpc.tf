resource "aws_vpc" "sh_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "development"
  }
}


resource "aws_internet_gateway" "sh_gw" {
  vpc_id = aws_vpc.sh_vpc.id

  tags = {
    Name = "development"
  }
}




# resource "aws_route_table" "sh_route" {
#   vpc_id = aws_vpc.sh_vpc.id

#   route = []

#   tags = {
#     Name = "development"
#   }
# }