provider "aws" {
  region = "ap-south-1"

  default_tags {
    tags = {
      Project     = "Enterprise AWS Secure Landing Zone"
      Environment = "Development"
      ManagedBy   = "Terraform"
      Owner       = "Shraddha"
    }
  }
}