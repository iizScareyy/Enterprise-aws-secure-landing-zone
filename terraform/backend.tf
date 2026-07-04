terraform {
  backend "s3" {
    bucket       = "enterprise-landing-zone-tfstate-shraddha"
    key          = "terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
    encrypt      = true
  }
}