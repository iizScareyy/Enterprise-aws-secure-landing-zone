###############################################
# High CPU Alarm
###############################################

resource "aws_cloudwatch_metric_alarm" "high_cpu" {

  alarm_name = "enterprise-high-cpu"

  comparison_operator = "GreaterThanOrEqualToThreshold"

  evaluation_periods = 2

  metric_name = "CPUUtilization"

  namespace = "AWS/EC2"

  period = 300

  statistic = "Average"

  threshold = 70

  alarm_description = "Scale out when CPU exceeds 70%"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.app_asg.name
  }

  alarm_actions = [
    aws_autoscaling_policy.scale_out.arn
  ]

}

###############################################
# Low CPU Alarm
###############################################

resource "aws_cloudwatch_metric_alarm" "low_cpu" {

  alarm_name = "enterprise-low-cpu"

  comparison_operator = "LessThanOrEqualToThreshold"

  evaluation_periods = 2

  metric_name = "CPUUtilization"

  namespace = "AWS/EC2"

  period = 300

  statistic = "Average"

  threshold = 20

  alarm_description = "Scale in when CPU falls below 20%"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.app_asg.name
  }

  alarm_actions = [
    aws_autoscaling_policy.scale_in.arn
  ]

}