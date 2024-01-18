output "vpc_id" {
  value = aws_vpc.main.id
}

output "private_subnet_ids" {
    value = aws_subnet.private_subnet[0].id
}

output "public_subnet_ids" {
    value = aws_subnet.public_subent[0].id
}