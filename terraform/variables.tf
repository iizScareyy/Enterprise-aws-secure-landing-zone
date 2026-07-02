variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "create_nat_gateway" {
  description = "Whether to create the NAT Gateway"
  type        = bool
  default     = false
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "AWS Key Pair Name"
  type        = string
  default     = "enterprise-key"
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "enterprise"
}

variable "db_username" {
  description = "Database administrator username"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}