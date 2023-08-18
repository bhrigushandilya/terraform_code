output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.ec2-instance[*].public_ip
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.ec2-instance[*].id
}

output "vpc_id" {
  description = "This is the ID of VPC"
  value       = module.vpc.vpc_id
}

output "security_group_id" {
  value = module.ec2-instance.security_group.id
}

output "aws_ami" {
  description = "ID of latest mazon linux AMI"
  value       = module.ec2-instance.ami_id.id
}

output "instance_public_dns" {
  description = "Public DNS of the instance"
  value       = module.ec2-instance.instance[*].public_dns
}

output "security_group_name" {
  description = "Name of the Security Group"
  value       = module.ec2-instance.security_group.name
}

output "lb_dns" {
  description = "DNS name of the Load Balancer"
  value       = module.load_balancer.lb.dns_name
}