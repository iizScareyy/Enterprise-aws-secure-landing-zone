###############################################
# Application Load Balancer
# Creates:
# - ALB
# - Target Group
# - Target Group Attachment
# - HTTP Listener
###############################################

resource "aws_lb" "app_alb" {

  name               = "enterprise-app-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.alb_sg.id
  ]

  subnets = [
    aws_subnet.public_subnet_a.id,
    aws_subnet.public_subnet_b.id
  ]

  tags = {
    Name = "enterprise-app-alb"
  }

}


resource "aws_lb_target_group" "app_tg" {

  name     = "enterprise-app-tg"
  port     = 80
  protocol = "HTTP"

  target_type = "instance"

  vpc_id = aws_vpc.main.id

  health_check {

    enabled = true

    path = "/"

    protocol = "HTTP"

    healthy_threshold = 2

    unhealthy_threshold = 2

    timeout = 5

    interval = 30

    matcher = "200"

  }

}

resource "aws_lb_target_group_attachment" "app_server" {

  target_group_arn = aws_lb_target_group.app_tg.arn

  target_id = aws_instance.app_server.id

  port = 80

}

resource "aws_lb_listener" "http" {

  load_balancer_arn = aws_lb.app_alb.arn

  port = 80

  protocol = "HTTP"

  default_action {

    type = "forward"

    target_group_arn = aws_lb_target_group.app_tg.arn

  }

}