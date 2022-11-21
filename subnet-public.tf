```hcl
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidrs[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidrs[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_2"
  }
}

resource "aws_route_table_association" "public_subnet_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_subnet_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public.id
}
```

