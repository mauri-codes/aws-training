# module "my_role" {
#     source = "git::https://github.com/mauri1789/aws-training.git//infrastructure/modules/iam_role?ref=v1.2"
#     role_name = "upb_role_1"
#     policy_statement = [
#         {
#             Action = [
#                 "ec2:Describe*",
#             ]
#             Effect   = "Allow"
#             Resource = "*"
#         },
#     ]
#     policy_arns = [
#         "arn:aws:iam::aws:policy/job-function/DatabaseAdministrator"
#     ]
# }

data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "mauri-terraform-state"
    key = "network.ftstate"
    region = "us-east-1"
  }
}

data "aws_vpc" "our_vpc" {
  filter {
    name = "tag:Name"
    values = ["upb-vpc"]
  }
}

module "my_sg" {
    source = "git::https://github.com/mauri1789/aws-training.git//infrastructure/modules/security_group?ref=v1.6"
    # source = "../modules/security_group"
    sg_name = "my_sg"
    # vpc_id = data.aws_vpc.our_vpc.id
    # vpc_id = data.terraform_remote_state.network.outputs.vpc_id
    ingress_rules = {
        shh = {
            description = "my ssh rule"
            port = "443"
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
    egress_rules = {
        all = {
            description = "all connections out allowed"
            port = 0
            protocol = "-1"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}
