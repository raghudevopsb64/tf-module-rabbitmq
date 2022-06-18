resource "aws_route53_record" "rabbitmq" {
  zone_id = var.PRIVATE_HOSTED_ZONE_ID
  name    = "${var.COMPONENT}-${var.ENV}.roboshop.internal"
  type    = "A"
  ttl     = "300"
  records = [aws_spot_instance_request.spot.private_ip]
}

