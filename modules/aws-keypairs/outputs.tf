output "public_ec2_key_pair_name" {
  value = aws_key_pair.public-ec2-key-pair.key_name
}

output "private_ec2_key_pair_name" {
  value = aws_key_pair.private-ec2-key-pair.key_name
}
