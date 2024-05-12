resource "aws_security_group" "ssh_sg" {
  name        = "SSH-Access"
  description = "Allow SSH access from any IP address"

  vpc_id = aws_vpc.sh_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH access from any IP address
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SSH-Access"
  }
}





resource "aws_security_group" "internal_sg" {
  name        = "Internal-SG"
  description = "Allow SSH and port 3000 access from VPC CIDR only"

  vpc_id = aws_vpc.sh_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.sh_vpc.cidr_block]  # Allow SSH access from VPC CIDR
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.sh_vpc.cidr_block]  # Allow port 3000 access from VPC CIDR
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = [aws_vpc.sh_vpc.cidr_block]
  }

  tags = {
    Name = "Internal-SG"
  }
}
