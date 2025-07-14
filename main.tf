provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow HTTP from VPC only"

  iingress {
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["10.0.0.0/16"]
  description = "Allow HTTP traffic from internal network"
  }

  egress {
  from_port   = 443
  to_port     = 443
  protocol    = "-1"
  cidr_blocks = ["35.182.0.0/16"]
  description = "Allow all outbound traffic"
  }

  tags = {
    Name = "SecureSG"
  }
}
