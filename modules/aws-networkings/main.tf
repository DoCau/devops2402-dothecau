
# Create a Public Subnet
resource "aws_subnet" "cau-public-subnet" {
  vpc_id                  = var.vpc_id
  map_public_ip_on_launch = var.map_public_ip_on_launch
  cidr_block              = var.public_subnet_cidr_block
  tags = {
    "Name"       = "cau-public-subnet-Dec2-1"
    "Costcenter" = "devops2402"
  }

}

# Create a Private Subnet
resource "aws_subnet" "cau-private-subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.private_subnet_cidr_block
  tags = {
    "Name"       = "cau-private-subnet-Dec2-1"
    "Costcenter" = "devops2402"
  }
}

#Create an Internet Gateway
resource "aws_internet_gateway" "cau-internetgw" {
  vpc_id = var.vpc_id
  tags = {
    "Name"       = "cau-internetgw-Dec2"
    "Costcenter" = "devops2402"
  }
}

#Create a Public Route Table
resource "aws_route_table" "cau-public-routetb" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.public_routetb_cidr_block
    gateway_id = aws_internet_gateway.cau-internetgw.id
  }
  tags = {
    "Name"       = "cau-public-routetb-Dec2"
    "Costcenter" = "devops2402"
  }
}

#Create an association of Public Route Table and Public Subnet
resource "aws_route_table_association" "public-association" {
  subnet_id      = aws_subnet.cau-public-subnet.id
  route_table_id = aws_route_table.cau-public-routetb.id
}

#Create a Private Route Table
resource "aws_route_table" "cau-private-routetb" {
  vpc_id = var.vpc_id
  tags = {
    "Name"       = "cau-private-routetb-Dec2"
    "Costcenter" = "devops2402"
  }
}

#Create an association of Private Route Table and Private Subnet
resource "aws_route_table_association" "private-association" {
  subnet_id      = aws_subnet.cau-private-subnet.id
  route_table_id = aws_route_table.cau-private-routetb.id
}
