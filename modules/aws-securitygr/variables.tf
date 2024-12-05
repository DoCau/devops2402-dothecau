variable "vpc_id" {
  type = string
}

variable "public_securitygr_name" {
  type = string
}

variable "private_securitygr_name" {
  type = string
}

variable "public_securitygr_list_ingress" {
  description = "this list when pass in values, it will be able to create multiple ingress(es) for security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "public_securitygr_list_egress" {
  description = "this list when pass in values, it will be able to create multiple egress(es) for security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "private_securitygr_list_ingress" {
  description = "this list when pass in values, it will be able to create multiple ingress(es) for security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "private_securitygr_list_egress" {
  description = "this list when pass in values, it will be able to create multiple egress(es) for security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
