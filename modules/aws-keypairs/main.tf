
resource "tls_private_key" "public-ec2-key-pair-generator" { #This resource is like a seed to generate key pair for public ec2
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_private_key" "private-ec2-key-pair-generator" { #This resource is like a seed to generate key pair for private ec2
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "public-ec2-key-pair" { #Create key pair for public ec2
  key_name   = "public-ec2-key-pair"
  public_key = tls_private_key.public-ec2-key-pair-generator.public_key_openssh
  tags = {
    "Costcenter" = "devops2402"
  }
}

resource "aws_key_pair" "private-ec2-key-pair" { #Create key pair for private ec2
  key_name   = "private-ec2-public-key"
  public_key = tls_private_key.private-ec2-key-pair-generator.public_key_openssh
  tags = {
    "Costcenter" = "devops2402"
  }
}

resource "local_file" "public-ec2-private-key" { #Create a file to store private key of public ec2
  filename = var.path_to_public_ec2_private_key  //"${path.root}/keypairs/public-ec2-private-key.pem"
  content  = tls_private_key.public-ec2-key-pair-generator.private_key_openssh
}

resource "local_file" "public-ec2-public-key" { #Create a file to store public key of public ec2
  filename = var.path_to_public_ec2_public_key  //"${path.root}/keypairs/public-ec2-public-key.pub"
  content  = aws_key_pair.public-ec2-key-pair.public_key
}

resource "local_file" "private-ec2-private-key" { #Create a file to store private key of private ec2
  filename = var.path_to_private_ec2_private_key  //"${path.root}/keypairs/private-ec2-private-key.pem"
  content  = tls_private_key.private-ec2-key-pair-generator.private_key_openssh
}

resource "local_file" "private-ec2-public-key" { #Create a file to store public key of private ec2
  filename = var.path_to_private_ec2_public_key  //"${path.root}/keypairs/private-ec2-public-key.pub"
  content  = aws_key_pair.private-ec2-key-pair.public_key
}

