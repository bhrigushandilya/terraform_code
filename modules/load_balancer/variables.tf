variable "env" {
  description = "Environment Name"
  type = string
#  default = "test"
}

variable "vpc_id" {}

variable "lb_type" {
  description = "Type of the Load Balancer"
  type = string
}

variable "security_group_id" {}

variable "subnet_id" {}

variable "instance_id" {}