terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

terraform {
  backend "s3" {
    # Bucket S3
    bucket = "mauri-terraform-state"
    key    = "network.ftstate"
    region = "us-east-1"
    # DynamoDB Table, Partition Key = LockID
    dynamodb_table = "mau-terraform-state"
  }
}

resource "aws_vpc" "main_vpc" {
  cidr_block = "10.16.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id
}

resource "aws_subnet" "sn_reserved_A" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.16.0.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Main"
  }
}

# Crear subnets de la lista
# Crear Route Table
# Asignar Route Table a subnets Web
