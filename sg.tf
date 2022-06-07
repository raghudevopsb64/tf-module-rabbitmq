resource "aws_security_group" "main" {
  name        = "allow_ec2_${var.COMPONENT}_${var.ENV}"
  description = "allow_ec2_${var.COMPONENT}_${var.ENV}"
  vpc_id      = var.VPC_ID

  ingress {
    description = "RABBITMQ"
    from_port   = 5672
    to_port     = 5672
    protocol    = "tcp"
    cidr_blocks = [var.VPC_CIDR]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ec2_${var.COMPONENT}_${var.ENV}"
  }
}

