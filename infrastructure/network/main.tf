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

locals {
    vpc_cidr = "10.16.0.0/16"
    subnets = {
        # AZ-A subnets
        "sn-reserved-A" = {
            cidr_block = "10.16.0.0/20"
            az = "us-east-1a"
        }
        "sn-db-A" = {
            cidr_block = "10.16.16.0/20"
            az = "us-east-1a"
        }
        "sn-app-A" = {
            cidr_block = "10.16.32.0/20"
            az = "us-east-1a"
        }
        "sn-web-A" = {
            cidr_block = "10.16.48.0/20"
            az = "us-east-1a"
        }
        # AZ-B subnets
        "sn-reserved-B" = {
            cidr_block = "10.16.64.0/20"
            az = "us-east-1b"
        }
        "sn-db-B" = {
            cidr_block = "10.16.80.0/20"
            az = "us-east-1b"
        }
        "sn-app-B" = {
            cidr_block = "10.16.96.0/20"
            az = "us-east-1b"
        }
        "sn-web-B" = {
            cidr_block = "10.16.112.0/20"
            az = "us-east-1b"
        }
        # AZ-C subnets
        "sn-reserved-C" = {
            cidr_block = "10.16.128.0/20"
            az = "us-east-1c"
        }
        "sn-db-C" = {
            cidr_block = "10.16.144.0/20"
            az = "us-east-1c"
        }
        "sn-app-C" = {
            cidr_block = "10.16.160.0/20"
            az = "us-east-1c"
        }
        "sn-web-C" = {
            cidr_block = "10.16.176.0/20"
            az = "us-east-1c"
        }

    }
}

resource "aws_vpc" "main_vpc" {
  cidr_block = local.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "upb-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id
}

# ############### AVAILABILITY ZONE A ######################

resource "aws_subnet" "sn_reserved_A" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = local.subnets.sn-reserved-A.cidr_block
  availability_zone = local.subnets.sn-reserved-A.az

  tags = {
    Name = "sn-reserved-A"
  }
}

resource "aws_subnet" "sn_db_A" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = local.subnets.sn-db-A.cidr_block
  availability_zone = local.subnets.sn-db-A.az

  tags = {
    Name = "sn-db-A"
  }
}

resource "aws_subnet" "sn_app_A" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = local.subnets.sn-app-A.cidr_block
  availability_zone = local.subnets.sn-app-A.az

  tags = {
    Name = "sn-app-A"
  }
}

resource "aws_subnet" "sn_web_A" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = local.subnets.sn-web-A.cidr_block
  availability_zone = local.subnets.sn-web-A.az

  tags = {
    Name = "sn-web-A"
  }
}

# ############### AVAILABILITY ZONE B ######################

resource "aws_subnet" "sn_reserved_B" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = local.subnets.sn-reserved-B.cidr_block
  availability_zone = local.subnets.sn-reserved-B.az

  tags = {
    Name = "sn-reserved-B"
  }
}

resource "aws_subnet" "sn_db_B" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = local.subnets.sn-db-B.cidr_block
  availability_zone = local.subnets.sn-db-B.az

  tags = {
    Name = "sn-db-B"
  }
}

resource "aws_subnet" "sn_app_B" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = local.subnets.sn-app-B.cidr_block
  availability_zone = local.subnets.sn-app-B.az

  tags = {
    Name = "sn-app-B"
  }
}

resource "aws_subnet" "sn_web_B" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = local.subnets.sn-web-B.cidr_block
  availability_zone = local.subnets.sn-web-B.az

  tags = {
    Name = "sn-web-B"
  }
}

# ############### AVAILABILITY ZONE C ######################

resource "aws_subnet" "sn_reserved_C" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = local.subnets.sn-reserved-C.cidr_block
  availability_zone = local.subnets.sn-reserved-C.az

  tags = {
    Name = "sn-reserved-C"
  }
}

resource "aws_subnet" "sn_db_C" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = local.subnets.sn-db-C.cidr_block
  availability_zone = local.subnets.sn-db-C.az

  tags = {
    Name = "sn-db-C"
  }
}

resource "aws_subnet" "sn_app_C" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = local.subnets.sn-app-C.cidr_block
  availability_zone = local.subnets.sn-app-C.az

  tags = {
    Name = "sn-app-C"
  }
}

resource "aws_subnet" "sn_web_C" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = local.subnets.sn-web-C.cidr_block
  availability_zone = local.subnets.sn-web-C.az

  tags = {
    Name = "sn-web-C"
  }
}

resource "aws_route_table" "upb_web_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "upb_web_rt"
  }
}

resource "aws_route_table_association" "association_A" {
  subnet_id      = aws_subnet.sn_web_A.id
  route_table_id = aws_route_table.upb_web_rt.id
}

resource "aws_route_table_association" "association_B" {
  subnet_id      = aws_subnet.sn_web_B.id
  route_table_id = aws_route_table.upb_web_rt.id
}

resource "aws_route_table_association" "association_C" {
  subnet_id      = aws_subnet.sn_web_C.id
  route_table_id = aws_route_table.upb_web_rt.id
}
