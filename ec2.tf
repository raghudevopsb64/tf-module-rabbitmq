resource "aws_spot_instance_request" "spot" {
  ami                    = data.aws_ami.ami.id
  instance_type          = var.NODE_TYPE
  vpc_security_group_ids = [aws_security_group.main.id]
  subnet_id              = var.SUBNET_IDS[0]
  wait_for_fulfillment   = true

  tags = {
    Name = "${var.COMPONENT}-${var.ENV}"
  }
}

resource "aws_ec2_tag" "name-tag" {
  resource_id = aws_spot_instance_request.spot.spot_instance_id
  key         = "Name"
  value       = "${var.COMPONENT}-${var.ENV}"
}

## Setup of rabbitmq inside ec2 is still pending
