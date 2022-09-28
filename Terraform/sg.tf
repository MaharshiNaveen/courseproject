module "bastion" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "bastion-SG"
  description = "Security group for ssh for custom ports open in VPC"
  vpc_id      = module.vpc.vpc_id


  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh-service ports"
      cidr_blocks = "0.0.0.0/0"
    },
]
egress_rules                                             = ["all-all"]
  egress_cidr_blocks                                       = ["0.0.0.0/0"]
}

module "Private_SG" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "Private-SG"
  description = "Security group for ssh for custom ports open in VPC"
  vpc_id      = module.vpc.vpc_id


  ingress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "tcp"
      description = "ssh-service ports"
      cidr_blocks = "0.0.0.0/0"
    },
]
egress_rules                                             = ["all-all"]
  egress_cidr_blocks                                       = ["0.0.0.0/0"]
}

module "public-SG" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "public-SG"
  description = "Security group for ssh for custom ports open in VPC"
  vpc_id      = module.vpc.vpc_id


  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "ssh-service ports"
      cidr_blocks = "0.0.0.0/0"
    },
]
egress_rules                                             = ["all-all"]
  egress_cidr_blocks                                       = ["0.0.0.0/0"]
}