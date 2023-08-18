variable "env" {
    description = "Environment Name"
    type = string
  }
  variable "image_id" {}
  variable "instance_type" {
      description = "Type of the instance"
      type = string
  }
  variable "key_name" {
      type = string  
  }
  variable "security_group_id" {}
  variable "vpc_zone_identifier" {}
  variable "target_group_arn" {}