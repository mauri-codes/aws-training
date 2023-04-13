# aws_subnet.subnets[KEY]
locals {
    vpc_cidr = "${var.ip_range_prefix}.0.0/16"
    subnets = {
        # AZ-A subnets
        "sn-reserved-A" = {
            cidr_block = "${var.ip_range_prefix}.0.0/20"
            az = "us-east-1a"
        }
        "sn-db-A" = {
            cidr_block = "${var.ip_range_prefix}.16.0/20"
            az = "us-east-1a"
        }
        "sn-app-A" = {
            cidr_block = "${var.ip_range_prefix}.32.0/20"
            az = "us-east-1a"
        }
        "sn-web-A" = {
            cidr_block = "${var.ip_range_prefix}.48.0/20"
            az = "us-east-1a"
        }
        # AZ-B subnets
        "sn-reserved-B" = {
            cidr_block = "${var.ip_range_prefix}.64.0/20"
            az = "us-east-1b"
        }
        "sn-db-B" = {
            cidr_block = "${var.ip_range_prefix}.80.0/20"
            az = "us-east-1b"
        }
        "sn-app-B" = {
            cidr_block = "${var.ip_range_prefix}.96.0/20"
            az = "us-east-1b"
        }
        "sn-web-B" = {
            cidr_block = "${var.ip_range_prefix}.112.0/20"
            az = "us-east-1b"
        }
        # AZ-C subnets
        "sn-reserved-C" = {
            cidr_block = "${var.ip_range_prefix}.128.0/20"
            az = "us-east-1c"
        }
        "sn-db-C" = {
            cidr_block = "${var.ip_range_prefix}.144.0/20"
            az = "us-east-1c"
        }
        "sn-app-C" = {
            cidr_block = "${var.ip_range_prefix}.160.0/20"
            az = "us-east-1c"
        }
        "sn-web-C" = {
            cidr_block = "${var.ip_range_prefix}.176.0/20"
            az = "us-east-1c"
        }
    }
}
