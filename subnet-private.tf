```hcl
resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidrs[0]

  tags = {
    Name = "private_subnet_1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidrs[1]

  tags = {
    Name = "private_subnet_2"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name = "private"
  }
}

resource "aws_route_table_association" "private_subnet_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_subnet_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private.id
}
```

