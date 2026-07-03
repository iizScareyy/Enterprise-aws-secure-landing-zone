###############################################
# Random Database Password
###############################################

resource "random_password" "db_password" {

  length  = 20
  special = true

}

###############################################
# Secrets Manager Secret
###############################################

resource "aws_secretsmanager_secret" "db_secret" {

  name = "enterprise-db-credentials"

  tags = {
    Name = "enterprise-db-credentials"
  }

}

###############################################
# Store Credentials
###############################################

resource "aws_secretsmanager_secret_version" "db_secret_value" {

  secret_id = aws_secretsmanager_secret.db_secret.id

  secret_string = jsonencode({

    username = var.db_username
    password = random_password.db_password.result
    database = var.db_name
    host     = aws_db_instance.postgres.address
    port     = aws_db_instance.postgres.port

  })

}