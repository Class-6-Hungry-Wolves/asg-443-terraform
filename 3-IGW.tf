resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.wolves-vpc.id

  tags = {
    Name    = "wolves-vpc_IG"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}
