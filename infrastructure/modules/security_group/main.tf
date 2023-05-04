resource "aws_security_group" "allow_tls" {
  name        = var.sg_name
  # vpc_id      = var.vpc_id

    # Homework: Use Ingress and Egress with foreach

  dynamic ingress {
    for_each = var.ingress_rules
    content {
      description      = ingress.value.description
      from_port        = ingress.value.port
      to_port          = ingress.value.port
      protocol         = ingress.value.protocol
      cidr_blocks      = ingress.value.cidr_blocks
    }
  }

  dynamic egress {
    for_each = var.egress_rules
    content {
      description      = egress.value.description
      from_port        = egress.value.port
      to_port          = egress.value.port
      protocol         = egress.value.protocol
      cidr_blocks      = egress.value.cidr_blocks
    }
  }

  tags = {
    Name = var.sg_name
  }
}
