###############################################
# S3 Bucket for CloudTrail Logs
###############################################

resource "aws_s3_bucket" "cloudtrail_logs" {

  bucket = "enterprise-cloudtrail-logs-shraddha"

  tags = {
    Name = "enterprise-cloudtrail-logs"
  }

}

###############################################
# Versioning
###############################################

resource "aws_s3_bucket_versioning" "cloudtrail_logs" {

  bucket = aws_s3_bucket.cloudtrail_logs.id

  versioning_configuration {
    status = "Enabled"
  }

}

###############################################
# KMS Encryption
###############################################

resource "aws_s3_bucket_server_side_encryption_configuration" "cloudtrail_logs" {

  bucket = aws_s3_bucket.cloudtrail_logs.id

  rule {

    apply_server_side_encryption_by_default {

      kms_master_key_id = aws_kms_key.enterprise_key.arn
      sse_algorithm     = "aws:kms"

    }

  }

}
###############################################
# CloudTrail Bucket Policy
###############################################

data "aws_iam_policy_document" "cloudtrail_bucket_policy" {

  statement {

    sid = "AWSCloudTrailAclCheck"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions = [
      "s3:GetBucketAcl"
    ]

    resources = [
      aws_s3_bucket.cloudtrail_logs.arn
    ]

  }

  statement {

    sid = "AWSCloudTrailWrite"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions = [
      "s3:PutObject"
    ]

    resources = [
      "${aws_s3_bucket.cloudtrail_logs.arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*"
    ]

    condition {

      test     = "StringEquals"
      variable = "s3:x-amz-acl"

      values = [
        "bucket-owner-full-control"
      ]

    }

  }

}

resource "aws_s3_bucket_policy" "cloudtrail_logs" {

  bucket = aws_s3_bucket.cloudtrail_logs.id

  policy = data.aws_iam_policy_document.cloudtrail_bucket_policy.json

}

###############################################
# CloudTrail
###############################################

resource "aws_cloudtrail" "enterprise_trail" {

  name = "enterprise-cloudtrail"

  s3_bucket_name = aws_s3_bucket.cloudtrail_logs.id

  kms_key_id = aws_kms_key.enterprise_key.arn

  include_global_service_events = true

  is_multi_region_trail = true

  enable_logging = true

  enable_log_file_validation = true

  depends_on = [
    aws_s3_bucket_policy.cloudtrail_logs
  ]

}