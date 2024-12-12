resource "aws_eip" "nat" {
  count  = length(var.public_subnets)
  domain = "vpc"
}

resource "aws_nat_gateway" "public" {
  count        = length(var.public_subnets)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id    = var.public_subnets[count.index]

  tags = {
    Name        = "${var.environment}-nat-gateway-${count.index + 1}"
    Environment = var.environment
  }
}
