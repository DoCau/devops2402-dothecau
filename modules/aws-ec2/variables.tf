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

variable "public_ec2_key_pair_name" {
  type = string
}

variable "private_ec2_key_pair_name" {
  type = string
}

variable "public_ec2_securitygrs" {
  type = list(string)
}

variable "private_ec2_securitygrs" {
  type = list(string)
}

variable "public_subnet_id" {
  type = string
}

variable "private_subnet_id" {
  type = string
}
