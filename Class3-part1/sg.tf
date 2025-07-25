resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id = aws_vpc.main.id
 

  ingress { #incoming connection
    description = "TLS from VPC"
    from_port   = 22 #from 
    to_port     = 22 #to
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress { #incoming connection
    description = "TLS from VPC"
    from_port   = 80 #from 
    to_port     = 80 #to
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress { 
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}