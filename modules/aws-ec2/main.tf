
#In order to search for ami id
data "aws_ami" "operating-system" {
  most_recent = var.is_ec2_os_most_recent

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

#Create a public EC2 Instance
resource "aws_instance" "public-ec2" {
  ami             = data.aws_ami.operating-system.id
  instance_type   = var.public_ec2_instance_type
  key_name        = var.public_ec2_key_pair_name #Attach public key to ec2
  security_groups = var.public_ec2_securitygrs
  subnet_id       = var.public_subnet_id
  tags = {
    "Name"       = "cau-public-ec2-Dec2"
    "Costcenter" = "devops2402"
  }
}

#Create a private EC2 Instance
resource "aws_instance" "private-ec2" {
  ami             = data.aws_ami.operating-system.id
  key_name        = var.private_ec2_key_pair_name #Attach public key to ec2
  instance_type   = var.private_ec2_instance_type
  security_groups = var.private_ec2_securitygrs
  subnet_id       = var.private_subnet_id
  tags = {
    "Name"       = "cau-private-ec2-Dec2"
    "Costcenter" = "devops2402"
  }

  root_block_device { #Original memory disk
    volume_size           = 20
    volume_type           = "gp2"
    delete_on_termination = true
  }

  ebs_block_device { #Additional memory disk
    device_name           = "/dev/sdi"
    volume_size           = 20
    volume_type           = "gp2"
    delete_on_termination = true
  }
}
