resource "aws_route_table" "upb_web_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "upb_web_rt"
  }
}

resource "aws_route_table_association" "association_A" {
  subnet_id      = aws_subnet.sn_web_A.id
  route_table_id = aws_route_table.upb_web_rt.id
}

resource "aws_route_table_association" "association_B" {
  subnet_id      = aws_subnet.sn_web_B.id
  route_table_id = aws_route_table.upb_web_rt.id
}

resource "aws_route_table_association" "association_C" {
  subnet_id      = aws_subnet.sn_web_C.id
  route_table_id = aws_route_table.upb_web_rt.id
}
