###############################################
# S3 Bucket for Terraform State
###############################################

resource "aws_s3_bucket" "terraform_state" {

  bucket = "enterprise-landing-zone-tfstate-shraddha"

  tags = {
    Name = "terraform-state"
  }

}

###############################################
# Enable Versioning
###############################################

resource "aws_s3_bucket_versioning" "terraform_state" {

  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }

}

###############################################
# Server Side Encryption
###############################################

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {

  bucket = aws_s3_bucket.terraform_state.id

  rule {

    apply_server_side_encryption_by_default {

      sse_algorithm = "AES256"

    }

  }

}

###############################################
# DynamoDB Lock Table
###############################################

resource "aws_dynamodb_table" "terraform_lock" {

  name = "terraform-state-lock"

  billing_mode = "PAY_PER_REQUEST"

  hash_key = "LockID"

  attribute {

    name = "LockID"

    type = "S"

  }

}