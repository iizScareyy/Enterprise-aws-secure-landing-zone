###############################################
# EC2 Assume Role Policy
###############################################

data "aws_iam_policy_document" "ec2_assume_role" {

  statement {

    effect = "Allow"

    actions = [
      "sts:AssumeRole"
    ]

    principals {

      type = "Service"

      identifiers = [
        "ec2.amazonaws.com"
      ]

    }

  }

}

###############################################
# IAM Role
###############################################

resource "aws_iam_role" "ec2_role" {

  name = "enterprise-ec2-role"

  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json

  tags = {
    Name = "enterprise-ec2-role"
  }

}

###############################################
# Least Privilege IAM Policy
###############################################

data "aws_iam_policy_document" "ec2_permissions" {

  ###############################################
  # CloudWatch Logs
  ###############################################

  statement {

    sid    = "CloudWatchLogs"
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]

    resources = [
      "*"
    ]

  }

  ###############################################
  # Secrets Manager
  ###############################################

  statement {

    sid    = "SecretsManagerAccess"
    effect = "Allow"

    actions = [
      "secretsmanager:GetSecretValue"
    ]

    resources = [
      aws_secretsmanager_secret.db_secret.arn
    ]

  }

}

###############################################
# IAM Policy
###############################################

resource "aws_iam_policy" "ec2_policy" {

  name        = "enterprise-ec2-policy"
  description = "Least privilege IAM policy for application EC2 instances"

  policy = data.aws_iam_policy_document.ec2_permissions.json

}

###############################################
# Attach Policy
###############################################

resource "aws_iam_role_policy_attachment" "ec2_policy_attachment" {

  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.ec2_policy.arn

}

###############################################
# Instance Profile
###############################################

resource "aws_iam_instance_profile" "ec2_profile" {

  name = "enterprise-ec2-profile"

  role = aws_iam_role.ec2_role.name

}