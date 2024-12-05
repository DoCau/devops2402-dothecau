output "public_ec2_securitygrs" {
  value = [aws_security_group.securitygr-public-ec2.id]
}

output "private_ec2_securitygrs" {
  value = [aws_security_group.securitygr-private-ec2.id]
}
