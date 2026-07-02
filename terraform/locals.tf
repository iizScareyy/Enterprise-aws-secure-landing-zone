locals {

  project_name = "Enterprise AWS Secure Landing Zone"
  environment  = "Development"
  owner        = "Shraddha"

  common_tags = {
    Project     = local.project_name
    Environment = local.environment
    Owner       = local.owner
    ManagedBy   = "Terraform"
  }

}