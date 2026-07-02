###############################################
# DB Subnet Group
###############################################

resource "aws_db_subnet_group" "db_subnet_group" {

  name = "enterprise-db-subnet-group"

  subnet_ids = [
    aws_subnet.private_subnet_a.id,
    aws_subnet.private_subnet_b.id
  ]

  tags = {
    Name = "enterprise-db-subnet-group"
  }

}