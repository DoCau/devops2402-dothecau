vpc_cidr_block       = "10.0.0.0/26"
enable_dns_hostnames = false
enable_dns_support   = false

public_routetb_cidr_block  = "0.0.0.0/0"
private_routetb_cidr_block = "10.0.0.0/26"
public_subnet_cidr_block   = "10.0.0.0/28"
private_subnet_cidr_block  = "10.0.0.16/28"
map_public_ip_on_launch    = true

is_ec2_os_most_recent     = true
private_ec2_instance_type = "t2.micro"
public_ec2_instance_type  = "t2.micro"

private_securitygr_name = "private-ec2-securitygroup"
public_securitygr_name  = "public-ec2-securitygroup"

path_to_private_ec2_private_key = "keypairs/private-ec2-private-key.pem"
path_to_private_ec2_public_key  = "keypairs/private-ec2-public-key.pub"
path_to_public_ec2_private_key  = "keypairs/public-ec2-private-key.pem"
path_to_public_ec2_public_key   = "keypairs/public-ec2-public-key.pub"

//"${path.root}/keypairs/private-ec2-public-key.pub"
//"${path.root}/keypairs/private-ec2-private-key.pem"
//"${path.root}/keypairs/public-ec2-public-key.pub"
//"${path.root}/keypairs/public-ec2-private-key.pem"
