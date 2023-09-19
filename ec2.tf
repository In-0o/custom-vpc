resource "aws_instance" "myec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  count         = var.count

  subnet_id         = element(aws_subnet.private.*.id, count.index)
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  user_data         = <<-EOF
    #!/bin/bash

    sudo -i -u ubuntu bash << 'EOF2'
      sudo apt update -y
      sudo apt install -y apache2
      systemctl enable apache2
      systemctl start apache2
    EOF2
  EOF

  tags = {
    Name = "private-instance-${count.index}"
  }
}