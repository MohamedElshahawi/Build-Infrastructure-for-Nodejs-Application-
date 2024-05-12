resource "aws_instance" "sh_instance" {
  ami           = "ami-0705384c0b33c194c" 
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.sh_subnet1.id  

  security_groups = [
    aws_security_group.ssh_sg.id,
  ]

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ip.txt"
  }
  key_name      = var.key_name


  tags = {
    Name = "bastion"
  }
}



resource "aws_instance" "sh_private_instance" {
  ami           = "ami-0705384c0b33c194c" 
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.sh_subnet3.id  

  security_groups = [
    aws_security_group.internal_sg.id,
  ]

  key_name      = var.key_name


  tags = {
    Name = "privateEc2"
  }
}
