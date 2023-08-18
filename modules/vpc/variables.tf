variable "vpc_cidr" {
  description = "CIDR for VPC"
  type = string
#  default = "10.0.0.0/16"
}

variable "env" {
  description = "Environment Name"
  type = string
#  default = "test"
}

variable "public_subnet_cidr" {
  description = "CIDR of public subnet"
#  default = "10.0.1.0/24"
}

variable "type1" {
  description = "Type of subnet"
  type = string
#  default = "public"
}

variable "private_subnet_cidr" {
  description = "CIDR of private subnet"
#  default = "10.0.2.0/24"
}

variable "type2" {
  description = "Type of subnet"
  type = string
#  default = "private"
}

variable "az" {}