resource "aws_subnet" "subnets" {
  for_each = local.subnets
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = each.value.cidr_block
  availability_zone = each.value.az

  tags = {
    Name = each.key
  }
}