variable "type" {
  description = "Type of the instance"
  type = string
#  default = "t2.micro"
}

variable "env" {
  description = "Environment Name"
  type = string
#  default = "test"
}

variable "vpc_id" {}
variable "public_subnet_id" {}
variable "az" {}