# Enterprise AWS Secure Landing Zone using Terraform

## Overview

This project demonstrates the design and deployment of a secure, production-style AWS environment using Terraform. The infrastructure follows Infrastructure as Code (IaC) principles and incorporates AWS security best practices, including network isolation, least-privilege access, centralized logging, and encryption.

The project is being built incrementally to simulate a real-world enterprise cloud deployment.

---

## Architecture

> Architecture diagram will be added upon project completion.

---

## AWS Services Used

- Amazon VPC
- Public & Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- AWS IAM *(In Progress)*
- EC2 *(Planned)*
- Application Load Balancer *(Planned)*
- Auto Scaling *(Planned)*
- Amazon RDS *(Planned)*
- Amazon S3 *(Planned)*
- AWS KMS *(Planned)*
- AWS CloudTrail *(Planned)*
- Amazon CloudWatch *(Planned)*

---

## Project Structure

```
terraform/
│── provider.tf
│── versions.tf
│── outputs.tf
│── vpc.tf
│── subnets.tf
│── internet_gateway.tf
│── route_tables.tf
│── private_route_table.tf
│── nat_gateway.tf

docs/
diagrams/
```

---

## Current Progress

- [x] Terraform project initialization
- [x] AWS Provider configuration
- [x] VPC creation
- [x] Public Subnets
- [x] Private Subnets
- [x] Internet Gateway
- [x] Public Route Table
- [x] NAT Gateway
- [x] Private Route Table
- [ ] Security Groups
- [ ] IAM Roles & Policies
- [ ] EC2
- [ ] Application Load Balancer
- [ ] Auto Scaling
- [ ] RDS
- [ ] CloudTrail
- [ ] CloudWatch
- [ ] KMS
- [ ] S3

---

## Technologies

- Terraform
- AWS
- Git
- GitHub

---

## Author

Shraddha Nakil