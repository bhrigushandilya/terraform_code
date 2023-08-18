output "vpc_id" {
  description = "Exporting the whole VPC"
  value = aws_vpc.vpc.id
}


output "public_subnet" {
  value = aws_subnet.public_subnet
}

output "private_subnet" {
  value = aws_subnet.private_subnet
}