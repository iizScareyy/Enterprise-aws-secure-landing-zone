output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_a_id" {
  value = aws_subnet.public_subnet_a.id
}

output "private_subnet_a_id" {
  value = aws_subnet.private_subnet_a.id
}

output "alb_security_group_id" {
  value = aws_security_group.alb_sg.id
}

output "app_security_group_id" {
  value = aws_security_group.app_sg.id
}

output "db_security_group_id" {
  value = aws_security_group.db_sg.id
}

output "iam_role_name" {
  value = aws_iam_role.ec2_role.name
}

output "instance_profile_name" {
  value = aws_iam_instance_profile.ec2_profile.name
}
output "public_subnet_b_id" {
  value = aws_subnet.public_subnet_b.id
}

output "private_subnet_b_id" {
  value = aws_subnet.private_subnet_b.id
}

output "alb_dns_name" {
  value = aws_lb.app_alb.dns_name
}

output "alb_arn" {
  value = aws_lb.app_alb.arn
}

output "target_group_arn" {
  value = aws_lb_target_group.app_tg.arn
}

output "launch_template_id" {
  value = aws_launch_template.app_template.id
}

output "autoscaling_group_name" {
  value = aws_autoscaling_group.app_asg.name
}

output "db_endpoint" {
  value = aws_db_instance.postgres.endpoint
}

output "db_port" {
  value = aws_db_instance.postgres.port
}

output "db_name" {
  value = aws_db_instance.postgres.db_name
}