module "main-vpc-caudo" {
  source               = "./modules/aws-vpc"
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
}

module "networking-items-caudo" {
  source = "./modules/aws-networkings"

  vpc_id = module.main-vpc-caudo.vpc_id

  public_routetb_cidr_block  = var.public_routetb_cidr_block
  private_routetb_cidr_block = var.private_routetb_cidr_block
  public_subnet_cidr_block   = var.public_subnet_cidr_block
  private_subnet_cidr_block  = var.private_subnet_cidr_block
  map_public_ip_on_launch    = var.map_public_ip_on_launch

  depends_on = [module.main-vpc-caudo]
}

module "ec2-items-caudo" {
  source = "./modules/aws-ec2"

  is_ec2_os_most_recent    = var.is_ec2_os_most_recent
  public_ec2_instance_type = var.public_ec2_instance_type
  public_ec2_key_pair_name = module.key-pair-items-caudo.public_ec2_key_pair_name #Attach public key to ec2
  public_ec2_securitygrs   = module.security-groups-caudo.public_ec2_securitygrs
  public_subnet_id         = module.networking-items-caudo.public_subnet_id

  private_ec2_key_pair_name = module.key-pair-items-caudo.private_ec2_key_pair_name #Attach public key to ec2
  private_ec2_instance_type = var.private_ec2_instance_type
  private_ec2_securitygrs   = module.security-groups-caudo.private_ec2_securitygrs
  private_subnet_id         = module.networking-items-caudo.private_subnet_id

  depends_on = [module.networking-items-caudo]
}

module "security-groups-caudo" {
  source = "./modules/aws-securitygr"

  vpc_id = module.main-vpc-caudo.vpc_id

  public_securitygr_name  = var.public_securitygr_name
  private_securitygr_name = var.private_securitygr_name

  public_securitygr_list_ingress = [{
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"] #Allowing connections from everywhere
    }
    #   , {
    #   from_port   = 80
    #   to_port     = 80
    #   protocol    = "tcp"
    #   cidr_blocks = ["0.0.0.0/0"] #Allowing HTTP from everywhere
    # }
  ]
  public_securitygr_list_egress = [{
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"] #Allowing outputs to everywhere
  }]

  private_securitygr_list_ingress = [{
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [tostring(var.vpc_cidr_block)]
  }]
  private_securitygr_list_egress = [{
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [tostring(var.vpc_cidr_block)]
  }]
}

module "key-pair-items-caudo" {
  source = "./modules/aws-keypairs"

  path_to_private_ec2_private_key = "${var.master_directory}/${var.path_to_private_ec2_private_key}"
  path_to_private_ec2_public_key  = "${var.master_directory}/${var.path_to_private_ec2_public_key}"
  path_to_public_ec2_private_key  = "${var.master_directory}/${var.path_to_public_ec2_private_key}"
  path_to_public_ec2_public_key   = "${var.master_directory}/${var.path_to_public_ec2_public_key}"
}

locals {
  //master_directory = path.root
  master_directory = "/home/ubuntu"
}


