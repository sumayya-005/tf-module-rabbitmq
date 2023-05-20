resource "aws_instance" "rabbitmq" {
  ami   = data.aws_ami.centos-8-ami.image_id
  instance_type = var.instance_type
  subnet_id = var.subnets[0]
  vpc_security_group_ids = [aws_security_group.sg.id]
  tags = {
    Name = "${var.env}-${var.name} -rabbitmq"
  }

  provisioner "remote-exec" {
    connection {
      host = self.private_ip
      user = local.SSH_USER
      pass = local.SSH_PASS
    }
  }
}