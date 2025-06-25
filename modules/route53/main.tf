# Route53 module stub 

resource "aws_route53_health_check" "primary" {
  fqdn              = var.primary_fqdn
  type              = "HTTP"
  resource_path     = "/"
  port              = 80
  failure_threshold = 3
  request_interval  = 30
}

resource "aws_route53_record" "primary" {
  zone_id = var.zone_id
  name    = var.record_name
  type    = "A"
  set_identifier = "primary"
  health_check_id = aws_route53_health_check.primary.id
  failover = "PRIMARY"
  ttl = 60
  records = [var.primary_ip]
}

resource "aws_route53_record" "secondary" {
  zone_id = var.zone_id
  name    = var.record_name
  type    = "A"
  set_identifier = "secondary"
  failover = "SECONDARY"
  ttl = 60
  records = [var.secondary_ip]
} 