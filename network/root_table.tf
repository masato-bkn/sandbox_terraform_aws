resource "aws_route_table" "route_table_public" {
  count  = length(var.availability_zones)
  vpc_id = aws_vpc.sample_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name        = "route_table_public_${var.availability_zones[count.index]}"
  }
}

resource "aws_route_table_association" "route_table_association_public" {
  count          = length(var.availability_zones)
  route_table_id = aws_route_table.route_table_public[count.index].id
  subnet_id      = aws_subnet.subnet_public[count.index].id
}
