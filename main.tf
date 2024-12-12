provider "aws" {
  region = var.region
}


module "vpc" {
  source      = "./modules/vpc"
  cidr_block  = var.vpc_cidr
  environment = var.environment
}
 
module "subnet" {
  source               = "./modules/subnet"
  vpc_id               = module.vpc.vpc_id  
  internet_gateway_id  = module.vpc.internet_gateway_id  
  public_subnet_cidr   = var.public_subnet_cidr
  web_subnet_cidr      = var.web_subnet_cidr
  app_subnet_cidr      = var.app_subnet_cidr
  availability_zones   = var.availability_zones
  environment          = var.environment
}

 

module "nat_gateway" {
  source         = "./modules/nat-gateway"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.subnet.public_subnets
  environment    = var.environment
}

module "bastion" {
  source         = "./modules/bastion"
  instance_type  = var.instance_type
  ami_id         = var.ami_id
  environment    = var.environment
  public_subnets = module.subnet.public_subnets
}


resource "aws_security_group" "elb_sg" {
  name        = "${var.environment}-elb-sg"
  description = "Security group for ELB"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-elb-sg"
  }
}


module "elb" {
  source           = "./modules/elb"
  public_subnets   = module.subnet.public_subnets
  vpc_id           = module.vpc.vpc_id
  environment      = var.environment
  security_groups  = [aws_security_group.elb_sg.id]
}


resource "aws_security_group" "ec2_sg" {
  name        = "${var.environment}-ec2-sg"
  description = "Security group for EC2 instances"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-ec2-sg"
  }
}

module "ec2" {
  source         = "./modules/ec2"
  instance_type  = var.instance_type
  ami_id         = var.ami_id
  security_groups = [aws_security_group.ec2_sg.id]
  vpc_id         = module.vpc.vpc_id
  environment    = var.environment
  subnets        = concat(module.subnet.web_subnets, module.subnet.app_subnets)  
}
