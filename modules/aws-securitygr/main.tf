
#Create Security Group for public EC2
resource "aws_security_group" "securitygr-public-ec2" {
  name   = var.public_securitygr_name
  vpc_id = var.vpc_id
  # ingress {
  #   from_port   = 22
  #   to_port     = 22
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"] #Allowing SSH from everywhere
  # }
  # ingress {
  #   from_port   = 80
  #   to_port     = 80
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"] #Allowing HTTP from everywhere
  # }

  dynamic "ingress" {
    for_each = var.public_securitygr_list_ingress
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  # ingress {
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = -1
  #   cidr_blocks = ["42.113.60.161/32"]
  # }
  # egress {
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = -1            #All traffics
  #   cidr_blocks = ["0.0.0.0/0"] #Allowing output to everywhere
  # }

  dynamic "egress" {
    for_each = var.public_securitygr_list_egress
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    "Costcenter" = "devops2402"
  }
}


#Create Security Group for private EC2
resource "aws_security_group" "securitygr-private-ec2" {
  name   = var.private_securitygr_name
  vpc_id = var.vpc_id
  # ingress {
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = -1 #All traffics
  #   cidr_blocks = ["10.0.0.0/26"]
  # }

  dynamic "ingress" {
    for_each = var.private_securitygr_list_ingress
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  # egress {
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = -1 #All traffics
  #   cidr_blocks = ["10.0.0.0/26"]
  # }

  dynamic "egress" {
    for_each = var.private_securitygr_list_egress
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    "Costcenter" = "devops2402"
  }
}
