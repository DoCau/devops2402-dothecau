variable "vpc_id" {
  type = string
}

variable "map_public_ip_on_launch" {
  type = bool
  //default = ""
}

variable "public_subnet_cidr_block" {
  type = string
}

variable "public_routetb_cidr_block" {
  type = string
}

variable "private_routetb_cidr_block" {
  type = string
}

variable "private_subnet_cidr_block" {
  type = string
}

