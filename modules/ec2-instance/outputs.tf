output "public_ip" {
  description = "Public IP of the EC2 instance"
  value = aws_instance.instance[*].public_ip
}

output "id" {
  description = "ID of the EC2 instance"
  value = aws_instance.instance[*].id
}

output "ami_id" {
  description = "ID of latest mazon linux AMI"
  value = data.aws_ami.latest_amazon_linux2
}

output "instance" {
  description = "Exporting the whole instance"
  value = aws_instance.instance
}

output "security_group" {
  description = "Exporting the whole security group"
  value = aws_security_group.sg
}

output "image_id" {
  description = "exporting the ami data source"
  value = data.aws_ami.latest_amazon_linux2
}