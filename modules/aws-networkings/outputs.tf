output "public_subnet_id" {
  value = aws_subnet.cau-public-subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.cau-private-subnet.id
}
