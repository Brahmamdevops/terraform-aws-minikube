resource "aws_instance" "web" {
  ami = data.aws_ami.centos8.id
  instance_type = "t2.micro" 
  vpc_security_group_ids= [aws_security_group.roboshop-all.id] # this means list  
   user_data = file("docker-installation.sh")
}



resource "aws_security_group" "roboshop-all" {  #this is terraform name, for terraform reference only
  name        = "work-station" # this is for AWS

  ingress {
    description      = "allow all ports"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "work-station"
  }
}


