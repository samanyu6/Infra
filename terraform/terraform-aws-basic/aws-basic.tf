provider "aws" {
    region     = "us-west-2"
#   access_key = "my-access-key"
#   secret_key = "my-secret-key"
}

resource "aws_vpc" "myvpc" {
    cidr_block       = "190.160.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "mysub" {
     vpc_id     = aws_vpc.myvpc.id
  cidr_block = "190.160.1.0/24"

  tags = {
    Name = "Main"
  }
}