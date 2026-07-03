###############################################
# PostgreSQL Database
###############################################

resource "aws_db_instance" "postgres" {

  identifier = "enterprise-postgres"

  engine         = "postgres"
  engine_version = "16.9"

  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp3"

  storage_encrypted = true

  db_name  = var.db_name
  username = var.db_username
  password = random_password.db_password.result

  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name

  vpc_security_group_ids = [
    aws_security_group.db_sg.id
  ]

  publicly_accessible = false

  backup_retention_period = 1

  apply_immediately          = true
  auto_minor_version_upgrade = false

  deletion_protection = false

  skip_final_snapshot = true

  tags = {
    Name = "enterprise-postgres"
  }

}