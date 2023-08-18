terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  env = var.env
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  az = var.az
  type1 = var.type1
  type2 = var.type2
}

module "ec2-instance" {
  source = "./modules/ec2-instance"
  type = var.type
  env = var.env
  vpc_id = module.vpc.vpc_id
  az = var.az
  public_subnet_id = module.vpc.public_subnet[*].id
}

module "load_balancer" {
  source = "./modules/load_balancer"
  env = var.env
  vpc_id = module.vpc.vpc_id
  lb_type = var.lb_type
  security_group_id = module.ec2-instance.security_group.id
  subnet_id = module.vpc.public_subnet[*].id
  instance_id = module.ec2-instance.instance[*].id
}