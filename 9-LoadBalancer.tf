resource "aws_lb" "wolves_lb01" {
  name               = "wolves-lb01"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.wolves-sg01-lb01.id]
  subnets            = [
    aws_subnet.public-us-east-1a.id,
    aws_subnet.public-us-east-1b.id,
    aws_subnet.public-us-east-1c.id
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "wolves-lb01"
    Service = "Multiapp"
    Owner   = "Chewbacca"
    Project = "Multiapp"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.wolves_lb01.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wolves_tg_80.arn
  }
}

data "aws_acm_certificate" "cert" {
  domain   = "callahancloud.com"
  statuses = ["ISSUED"]
  most_recent = true
}


resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.wolves_lb01.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"  # or whichever policy suits your requirements
  certificate_arn   = data.aws_acm_certificate.cert.arn



  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wolves_tg_443.arn
  }
}

output "lb_dns_name" {
  value       = aws_lb.wolves_lb01.dns_name
  description = "The DNS name of the App1 Load Balancer."
}
