###############################################
# EC2
# Creates:
# - Amazon Linux 2023 AMI Lookup
# - Key Pair
# - EC2 Instance
###############################################


data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "enterprise_key" {
  key_name   = var.key_name
  public_key = file("C:/Users/Scareyy/.ssh/id_ed25519.pub")

}




