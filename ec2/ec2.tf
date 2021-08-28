resource "aws_instance" "sample_ec2" {
  ami                         = "ami-09ebacdc178ae23b7"
  instance_type               = "t2.micro"
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.ec2_security_group.id]
  associate_public_ip_address = true
  tags = {
    Name = "sample-ec2"
  }
}
