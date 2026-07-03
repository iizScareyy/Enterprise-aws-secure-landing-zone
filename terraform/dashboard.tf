###############################################
# CloudWatch Dashboard
###############################################

resource "aws_cloudwatch_dashboard" "enterprise_dashboard" {

  dashboard_name = "enterprise-dashboard"

  dashboard_body = jsonencode({

    widgets = [

      {
        type = "metric"

        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {

          title = "EC2 CPU Utilization"

          metrics = [
            [
              "AWS/EC2",
              "CPUUtilization",
              "AutoScalingGroupName",
              aws_autoscaling_group.app_asg.name
            ]
          ]

          stat   = "Average"
          period = 300
          region = var.aws_region

        }

        }, {
        type   = "metric"
        x      = 0
        y      = 6
        width  = 12
        height = 6

        properties = {
          title = "Healthy Hosts"

          metrics = [
            [
              "AWS/ApplicationELB",
              "HealthyHostCount",
              "TargetGroup",
              aws_lb_target_group.app_tg.arn_suffix,
              "LoadBalancer",
              aws_lb.app_alb.arn_suffix
            ]
          ]

          stat   = "Average"
          period = 300
          region = var.aws_region
        }
        }, {
        type   = "metric"
        x      = 12
        y      = 6
        width  = 12
        height = 6

        properties = {
          title = "RDS CPU Utilization"

          metrics = [
            [
              "AWS/RDS",
              "CPUUtilization",
              "DBInstanceIdentifier",
              aws_db_instance.postgres.id
            ]
          ]

          stat   = "Average"
          period = 300
          region = var.aws_region
        }
      },



      {
        type = "metric"

        x      = 12
        y      = 0
        width  = 12
        height = 6

        properties = {

          title = "ALB Request Count"

          metrics = [
            [
              "AWS/ApplicationELB",
              "RequestCount",
              "LoadBalancer",
              aws_lb.app_alb.arn_suffix
            ]
          ]

          stat   = "Sum"
          period = 300
          region = var.aws_region

        }

      }

    ]

  })

}