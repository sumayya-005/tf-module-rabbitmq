resource "aws_instance" "rabbitmq" {
  ami =""
  instance_type = var.instance_type
  subnet_id = var.subnets
  tags = {
    Name = "${var.env}-${var.name} -rabbitmq"
  }
}