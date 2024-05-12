output vpc_id {
    value = aws_vpc.sh_vpc.id
  
}


output public_subnet_ids {
  value = [
    aws_subnet.sh_subnet1.id,
    aws_subnet.sh_subnet2.id
  ]
}

output private_subnet_ids {
  value = [
    aws_subnet.sh_subnet3.id,
    aws_subnet.sh_subnet4.id
  ]
}


output "public_ssh_sg_id" {
  value = aws_security_group.ssh_sg.id
}
output "internal_sg_id" {
  value = aws_security_group.internal_sg.id
}


output "sh_instance" {
  value = [ aws_instance.sh_instance.id,
            aws_instance.sh_instance.public_ip
  ]
}