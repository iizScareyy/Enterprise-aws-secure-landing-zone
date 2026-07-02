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




resource "aws_instance" "app_server" {

  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.private_subnet_a.id

  vpc_security_group_ids = [
    aws_security_group.app_sg.id
  ]

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  key_name = aws_key_pair.enterprise_key.key_name

  associate_public_ip_address = false

  user_data = file("${path.module}/scripts/user_data.sh")

  tags = {
    Name = "application-server"
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

}