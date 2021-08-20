resource "aws_vpc" "sample_vpc" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "sample_vpc"
  }
}
