variable "cidr_block" {
  type        = string
  description = "IP CIDR of VPC"
}

variable "enable_dns_hostnames" {
  type    = bool
  default = false
}

variable "enable_dns_support" {
  type    = bool
  default = false
}
