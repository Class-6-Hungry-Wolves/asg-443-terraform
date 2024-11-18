resource "aws_security_group" "wolves-sg01-tg01-80" {
  name        = "wolves-sg01-tg01-80"
  description = "wolves-sg01-tg01-80"
  vpc_id      = aws_vpc.wolves-vpc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }



  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "wolves-sg01-tg01-80"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }

}





resource "aws_security_group" "wolves-sg01-lb01" {
  name        = "wolves-sg01-lb01"
  description = "wolves-sg01-lb01"
  vpc_id      = aws_vpc.wolves-vpc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "wolves-sg01-lb01"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }

}


resource "aws_security_group" "wolves-sg01-tg02-443" {
  name        = "wolves-sg01-tg02-443"
  description = "wolves-sg01-tg02-443"
  vpc_id      = aws_vpc.wolves-vpc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "wolves-sg01-tg02-443"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }

}
