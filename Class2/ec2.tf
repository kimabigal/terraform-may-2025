resource "aws_instance" "web" {
  ami           = "ami-0cbbe2c6a1bb2ad63"
  instance_type = "t2.micro"
 # availability_zone = "us-east-1a" #zone should be diff from where it was created
subnet_id = "subnet-052ca5c5fcb9757b7"
key_name = aws_key_pair.deployer.key_name
vpc_security_group_ids = [aws_security_group.allow_tls.id]
user_data = file("apache.sh")

  tags = {
    Name = "HelloWorld"
  }
}



output ec2 {
value = aws_instance.web.public_ip

}