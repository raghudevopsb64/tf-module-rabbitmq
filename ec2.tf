resource "aws_spot_instance_request" "spot" {
  ami                    = data.aws_ami.ami.id
  instance_type          = var.NODE_TYPE
  vpc_security_group_ids = [aws_security_group.main.id]
  subnet_id              = var.SUBNET_IDS[0]

  tags = {
    Name = "${var.COMPONENT}-${var.ENV}"
  }
}


