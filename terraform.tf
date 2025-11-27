provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_instance" "Staticweb" {
  ami = var.my_ami
  instance_type = var.my_instance
  key_name = var.my_key
  vpc_security_group_ids = [aws_security_group.staticweb_sg.id]
  user_data = file("user_data.sh")
  tags = {
    Name= "staticWeb_server"
  }
}

output "ec2_public_ip" {
  value = aws_instance.Staticweb.public_ip
}


