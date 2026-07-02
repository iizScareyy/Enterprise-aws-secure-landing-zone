resource "aws_eip" "nat_eip" {
  count = var.create_nat_gateway ? 1 : 0

  domain = "vpc"

  tags = {
    Name = "nat-eip"
  }
}

resource "aws_nat_gateway" "nat" {
  count = var.create_nat_gateway ? 1 : 0

  allocation_id = aws_eip.nat_eip[0].id
  subnet_id     = aws_subnet.public_subnet_a.id

  depends_on = [
    aws_internet_gateway.igw
  ]

  tags = {
    Name = "enterprise-nat-gateway"
  }
}