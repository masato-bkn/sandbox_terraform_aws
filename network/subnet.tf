resource "aws_subnet" "subnet_public" {
  count = length(var.availability_zones)
  vpc_id     = aws_vpc.sample_vpc.id
  cidr_block = cidrsubnet(var.vpc_cidr, 3, 0 + count.index)
  availability_zone = "ap-northeast-1${var.availability_zones[count.index]}"

  tags = {
    Name  = "subnet_public_${var.availability_zones[count.index]}"
  }
}
