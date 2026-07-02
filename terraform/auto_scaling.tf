###############################################
# Launch Template
###############################################

resource "aws_launch_template" "app_template" {

  name_prefix = "enterprise-app-"

  image_id = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  key_name = aws_key_pair.enterprise_key.key_name

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }

  vpc_security_group_ids = [
    aws_security_group.app_sg.id
  ]

  user_data = base64encode(
    file("${path.module}/scripts/user_data.sh")
  )

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "application-server"
    }
  }

}

###############################################
# Auto Scaling Group
###############################################

resource "aws_autoscaling_group" "app_asg" {

  name = "enterprise-app-asg"

  desired_capacity = 2
  min_size         = 2
  max_size         = 4

  vpc_zone_identifier = [
    aws_subnet.private_subnet_a.id,
    aws_subnet.private_subnet_b.id
  ]

  target_group_arns = [
    aws_lb_target_group.app_tg.arn
  ]

  health_check_type = "ELB"

  launch_template {
    id      = aws_launch_template.app_template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "application-server"
    propagate_at_launch = true
  }

}