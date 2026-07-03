# Enterprise AWS Secure Landing Zone

A production-inspired AWS infrastructure built with Terraform following Infrastructure as Code (IaC) best practices.

This project provisions a production-inspired AWS infrastructure featuring secure networking, load balancing, auto scaling, monitoring, AWS WAF protection, remote Terraform state management, and a PostgreSQL database using Infrastructure as Code (Terraform).

![Terraform](https://img.shields.io/badge/Terraform-1.13+-623CE4?logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazonaws)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-CI-blue?logo=githubactions)
![License](https://img.shields.io/badge/License-MIT-green)


## Project Overview

This project demonstrates how to provision a production-inspired AWS landing zone using Terraform.

The infrastructure follows Infrastructure as Code (IaC) principles and implements secure networking, high availability, monitoring, web application protection, and automated infrastructure validation using GitHub Actions.

## Features

- Custom Amazon VPC
- Public & Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- IAM Roles & Instance Profiles
- EC2 Launch Template
- Application Load Balancer (ALB)
- Auto Scaling Group
- PostgreSQL RDS
- AWS WAF Protection
- CloudWatch Alarms
- CloudWatch Dashboard
- Remote Terraform State (Amazon S3)
- Terraform State Locking (Amazon DynamoDB)
- GitHub Actions CI Pipeline
- Infrastructure as Code using Terraform


## Architecture

![AWS Architecture](pics/architecture.png)

## Architecture Highlights

- Internet-facing Application Load Balancer protected by AWS WAF
- EC2 instances deployed in private subnets across multiple Availability Zones
- Auto Scaling Group provides high availability and scalability
- PostgreSQL RDS deployed in private subnets using an RDS DB Subnet Group
- CloudWatch alarms and dashboards monitor infrastructure health
- Terraform remote state stored securely in Amazon S3 with DynamoDB state locking
- GitHub Actions automatically validates Terraform code on every push

## AWS Services Used

- Amazon VPC
- Amazon EC2
- Application Load Balancer
- Auto Scaling Group
- Amazon RDS PostgreSQL
- CloudWatch
- IAM
- Internet Gateway
- NAT Gateway
- Security Groups
- Terraform
- GitHub Actions
- AWS WAF
- Amazon S3
- Amazon DynamoDB

## Monitoring

CloudWatch provides operational visibility into the deployed infrastructure.

The dashboard includes:

- EC2 CPU Utilization
- ALB Request Count
- Healthy Host Count
- RDS CPU Utilization

## Security

- AWS WAF protects the Application Load Balancer
- EC2 instances are deployed in private subnets
- PostgreSQL RDS is not publicly accessible
- IAM Roles provide least-privilege access
- Security Groups restrict inbound and outbound traffic
- Terraform state is securely stored in Amazon S3

## CI/CD Pipeline

This project uses GitHub Actions to automatically validate Terraform code on every push and pull request.

The pipeline performs:

- Terraform Format Check (`terraform fmt -check`)
- Terraform Initialization (`terraform init`)
- Terraform Validation (`terraform validate`)
- Terraform Execution Plan (`terraform plan`)

This ensures infrastructure changes are validated before deployment.


## Project Structure

```text
Enterprise-aws-secure-landing-zone
│
├── .github/
│   └── workflows/
│       └── terraform.yml
│
│
├── terraform/
│   ├── alb.tf
│   ├── autoscaling.tf
│   ├── cloudwatch.tf
│   ├── db.tf
│   ├── ec2.tf
│   ├── iam.tf
│   ├── networking.tf
│   ├── outputs.tf
│   ├── provider.tf
│   ├── backend.tf
│   ├── dashboard.tf
│   ├── versions.tf
│   ├── waf.tf
│   ├── security_groups.tf
│   ├── variables.tf
│   └── ...
│
└── README.md
```


## Deployment

Clone the repository

```bash
git clone https://github.com/iizScareyy/Enterprise-aws-secure-landing-zone.git
```

Navigate to the Terraform directory

```bash
cd terraform
```

Initialize Terraform

```bash
terraform init
```

Validate configuration

```bash
terraform validate
```

Review execution plan

```bash
terraform plan
```

Deploy infrastructure

```bash
terraform apply
```



## Cleanup

Destroy all infrastructure

```bash
terraform destroy
```

## Author

**Shraddha**

- AWS Certified Solutions Architect – Associate (SAA-C03)
- GitHub: **https://github.com/iizScareyy**