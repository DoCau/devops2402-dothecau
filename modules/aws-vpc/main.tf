# Create a VPC
resource "aws_vpc" "cau-vpc" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  tags = {
    "Name"       = "cau-vpc-Dec2-1"
    "Costcenter" = "devops2402"
  }
}
