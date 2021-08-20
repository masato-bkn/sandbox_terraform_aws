resource "aws_vpc" "sample_vpc" {
  cidr_block       = var.vpc_cidr

  tags = {
    Name = "sample_vpc"
  }
}
