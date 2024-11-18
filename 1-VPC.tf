# this  makes  vpc.id which is aws_vpc.wolves-vpc.id
resource "aws_vpc" "wolves-vpc" {
  cidr_block = "10.80.0.0/16"

  tags = {
    Name = "wolves-vpc"
    Service = "application1"
    Owner = "Chewbacca"
    Planet = "Mustafar"
  }
}
