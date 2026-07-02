terraform {
  backend "s3" {
    bucket         = "enterprise-landing-zone-tfstate-shraddha"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}