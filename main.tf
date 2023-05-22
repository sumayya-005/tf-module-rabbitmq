resource "aws_instance" "rabbitmq" {
  ami   = data.aws_ami.centos-8-ami.image_id
  instance_type = var.instance_type
  subnet_id = var.subnets[0]
  vpc_security_group_ids = [aws_security_group.sg.id]
  iam_instance_profile   = aws_iam_instance_profile.instance_profile.name
  tags = {
    Name = "${var.env}-${var.name} -rabbitmq"
  }

#  provisioner "remote-exec" {
#    connection {
#      host = self.private_ip
#      user = local.SSH_USER
#      password = local.SSH_PASS
#    }
#
#    inline = {
#      "sudo yum install python39-devel -y" ,
#      " sudo pip3.9 install ansible botocore boto3" ,
#     " ansible-pull -i localhost, -U https://github.com/sumayya-005/roboshop-ansible roboshop.yml -e ROLE_NAME=${COMPONENT} -e ENV=${var.env}"
#
#  }
#  }
}

resource "null_resource" "ansible-apply" {
    provisioner "remote-exec" {
      connection {
        host = aws_instance.rabbitmq.private_ip
        user = local.SSH_USER
        password = local.SSH_PASS
      }

      inline={
        "sudo yum install python39-devel -y" ,
        " sudo pip3.9 install ansible botocore boto3" ,
       " ansible-pull -i localhost, -U https://github.com/sumayya-005/roboshop-ansible roboshop.yml -e ROLE_NAME=${COMPONENT} -e ENV=${var.env}"

    }
    }
}