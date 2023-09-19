resource "aws_lb" "my-alb" {
  name               = var.alb_name
  subnets            = aws_subnet.public.*.id
  load_balancer_type = "application"

  security_groups = [aws_security_group.alb_sg.id]

  tags = {
    Name = "my-alb"
  }
}