# Enterprise AWS Secure Landing Zone

A production-inspired AWS Landing Zone built with **Terraform**, implementing secure networking, identity and access management, encryption, monitoring, auditing, and web application protection following Infrastructure as Code (IaC) best practices.

![Terraform](https://img.shields.io/badge/Terraform-1.13+-623CE4?logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazonaws)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-CI-blue?logo=githubactions)
![License](https://img.shields.io/badge/License-MIT-green)

---

# Project Overview

This project demonstrates how to design and provision a secure, production-inspired AWS environment using Terraform.

The infrastructure emphasizes cloud security, high availability, infrastructure automation, monitoring, auditing, and least-privilege access while following Infrastructure as Code (IaC) best practices.

---

# Features

### Networking

- Custom Amazon VPC
- Public & Private Subnets across multiple Availability Zones
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups

### Compute & Availability

- EC2 Launch Template
- Application Load Balancer (ALB)
- Auto Scaling Group

### Database

- Amazon RDS PostgreSQL
- Private DB Subnet Group

### Identity & Security

- IAM Roles & Instance Profiles
- Least-Privilege IAM Policies
- AWS Secrets Manager
- Customer Managed AWS KMS Key
- AWS WAF
  - AWS Managed Rules
  - Known Bad Inputs Rule Set
  - Amazon IP Reputation List
  - Rate Limiting

### Monitoring & Auditing

- CloudWatch Dashboard
- CloudWatch Alarms
- VPC Flow Logs
- AWS CloudTrail

### Infrastructure Automation

- Terraform Remote State (Amazon S3)
- Terraform State Locking
- GitHub Actions CI Pipeline

---

# Architecture

![AWS Architecture](pics/architecture.png)

---

# Architecture Highlights

- Internet-facing Application Load Balancer protected by AWS WAF.
- EC2 instances are deployed in private subnets behind the load balancer.
- Auto Scaling provides high availability across Availability Zones.
- PostgreSQL RDS is deployed privately and is inaccessible from the Internet.
- Database credentials are securely stored in AWS Secrets Manager.
- Customer-managed AWS KMS key encrypts sensitive resources.
- AWS CloudTrail records API activity for auditing.
- VPC Flow Logs capture network traffic for monitoring and troubleshooting.
- CloudWatch Dashboard and Alarms provide operational visibility.
- Terraform state is stored remotely in Amazon S3 with state locking.
- GitHub Actions automatically validates Terraform code on every push and pull request.

---

# Security Features

This project implements several AWS security best practices:

- Principle of Least Privilege using IAM Roles
- Secrets stored securely in AWS Secrets Manager
- Customer Managed KMS Encryption
- Private EC2 instances
- Private Amazon RDS
- Security Group based network segmentation
- Web Application Firewall (AWS WAF)
- CloudTrail API auditing
- VPC Flow Logs
- Remote Terraform State

---

# Monitoring

CloudWatch Dashboard includes:

- EC2 CPU Utilization
- ALB Request Count
- Healthy Host Count
- RDS CPU Utilization

CloudWatch Alarms automatically monitor infrastructure health and scaling metrics.

---

# CI/CD

GitHub Actions automatically validates every infrastructure change.

Pipeline stages:

- Terraform Format Check
- Terraform Initialization
- Terraform Validation
- Terraform Execution Plan

This helps ensure infrastructure quality before deployment.

---

# AWS Services Used

- Amazon VPC
- Amazon EC2
- Application Load Balancer
- Auto Scaling Group
- Amazon RDS PostgreSQL
- AWS IAM
- AWS WAF
- AWS KMS
- AWS Secrets Manager
- AWS CloudTrail
- Amazon CloudWatch
- VPC Flow Logs
- Amazon S3
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- Terraform
- GitHub Actions

---

# Project Structure

```text
Enterprise-aws-secure-landing-zone
│
├── .github/
│   └── workflows/
│       └── terraform.yml
│
├── backend-bootstrap/
│   ├── provider.tf
│   ├── versions.tf
│   └── backend_resources.tf
│
├── terraform/
│   ├── alb.tf
│   ├── auto_scaling.tf
│   ├── cloudtrail.tf
│   ├── cloudwatch.tf
│   ├── dashboard.tf
│   ├── ec2.tf
│   ├── iam.tf
│   ├── kms.tf
│   ├── networking.tf
│   ├── rds.tf
│   ├── secrets.tf
│   ├── vpc_flow_logs.tf
│   ├── waf.tf
│   ├── backend.tf
│   └── ...
│
├── pics/
│
└── README.md
```

---

# Deployment

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

---

# Cleanup

Destroy all infrastructure

```bash
terraform destroy
```

---

# Key Learning Outcomes

This project demonstrates practical experience with:

- Infrastructure as Code (Terraform)
- Secure AWS Networking
- IAM & Least Privilege Access
- Secrets Management
- Customer Managed Encryption (KMS)
- Security Monitoring & Auditing
- AWS WAF
- High Availability
- Infrastructure Automation
- CI/CD for Terraform

---

# Author

**Shraddha**

- AWS Certified Solutions Architect – Associate (SAA-C03)
- GitHub: https://github.com/iizScareyy