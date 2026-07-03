###############################################
# Customer Managed KMS Key
###############################################

resource "aws_kms_key" "enterprise_key" {

  description             = "Customer managed KMS key for Enterprise Landing Zone"
  deletion_window_in_days = 7

  enable_key_rotation = true

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [

      {
        Sid = "EnableRootPermissions"

        Effect = "Allow"

        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }

        Action = "kms:*"

        Resource = "*"
      },

      {
        Sid = "AllowCloudTrail"

        Effect = "Allow"

        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }

        Action = [
          "kms:GenerateDataKey*",
          "kms:Decrypt",
          "kms:DescribeKey"
        ]

        Resource = "*"
      }

    ]
  })

  tags = {
    Name = "enterprise-kms-key"
  }

}

###############################################
# KMS Alias
###############################################

resource "aws_kms_alias" "enterprise_key_alias" {

  name = "alias/enterprise-key"

  target_key_id = aws_kms_key.enterprise_key.key_id

}