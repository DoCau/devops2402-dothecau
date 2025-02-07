variable "vpc_cidr_block" {
  type = string
}

variable "enable_dns_hostnames" {
  type = bool
  # default = "" #leave it as "" will make this variable an optional field
}

variable "enable_dns_support" {
  type = bool
}

variable "public_routetb_cidr_block" {
  type = string
}

variable "private_routetb_cidr_block" {
  type = string
}

variable "public_subnet_cidr_block" {
  type = string
}

variable "private_subnet_cidr_block" {
  type = string
}

variable "map_public_ip_on_launch" {
  type    = bool
  default = true
}

variable "is_ec2_os_most_recent" {
  type    = bool
  default = true
}

variable "public_ec2_instance_type" {
  type = string
}

variable "private_ec2_instance_type" {
  type = string
}

variable "public_securitygr_name" {
  type = string
}

variable "private_securitygr_name" {
  type = string
}

variable "path_to_private_ec2_private_key" {
  type = string
}

variable "path_to_private_ec2_public_key" {
  type = string
}

variable "path_to_public_ec2_private_key" {
  type = string
}

variable "path_to_public_ec2_public_key" {
  type = string
}

//------------------------------------------

