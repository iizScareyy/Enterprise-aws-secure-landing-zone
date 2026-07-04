###############################################
# CloudWatch Log Group
###############################################

resource "aws_cloudwatch_log_group" "vpc_flow_logs" {

  name = "/aws/vpc/flowlogs"

  retention_in_days = 30

  kms_key_id = aws_kms_key.enterprise_key.arn

}

###############################################
# IAM Role
###############################################

resource "aws_iam_role" "flow_logs_role" {

  name = "enterprise-flow-logs-role"

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Principal = {

          Service = "vpc-flow-logs.amazonaws.com"

        }

        Action = "sts:AssumeRole"

      }

    ]

  })

}

###############################################
# IAM Policy
###############################################

resource "aws_iam_role_policy" "flow_logs_policy" {

  name = "enterprise-flow-logs-policy"

  role = aws_iam_role.flow_logs_role.id

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Action = [

          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams"

        ]

        Resource = "*"

      }

    ]

  })

}

###############################################
# VPC Flow Logs
###############################################

resource "aws_flow_log" "vpc_flow_logs" {

  log_destination = aws_cloudwatch_log_group.vpc_flow_logs.arn

  log_destination_type = "cloud-watch-logs"

  iam_role_arn = aws_iam_role.flow_logs_role.arn

  traffic_type = "ALL"

  vpc_id = aws_vpc.main.id

}