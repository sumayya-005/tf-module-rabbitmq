resource "aws_instance" "rabbitmq" {
  ami   = data.aws_ami.centos-8-ami.image_id
  instance_type = var.instance_type
  subnet_id = var.subnets
  tags = {
    Name = "${var.env}-${var.name} -rabbitmq"
  }
}