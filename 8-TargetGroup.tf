resource "aws_lb_target_group" "wolves_tg_80" {
  name     = "wolves-tg-80"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.wolves-vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "wolves-tg-80"
    Service = "App1"
    Owner   = "Chewbacca"
    Project = "App1"
  }
}

resource "aws_lb_target_group" "wolves_tg_443" {
  name     = "wolves-tg-443"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.wolves-vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "wolves_tg_443"
    Service = "App2"
    Owner   = "Chewbacca"
    Project = "App2"
  }
}
