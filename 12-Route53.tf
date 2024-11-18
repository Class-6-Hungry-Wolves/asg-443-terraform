
data "aws_route53_zone" "main" {
  name         = "callahancloud.com"  # The domain name you want to look up
  private_zone = false
}


resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "callahancloud.com"
  type    = "A"

  alias {
    name                   = aws_lb.wolves_lb01.dns_name
    zone_id                = aws_lb.wolves_lb01.zone_id
    evaluate_target_health = true
  }
}
