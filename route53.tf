resource "aws_route53_record" "private" {
 zone_id = var.private_zone_id
 name    = "${var.name}-${var.env}"
 type    = "A"
 ttl     = 300
 records = [aws_instance.rabbitmq.private_ip]
}
