variable "vpc__network_name" {
  type    = string
  default = "vpc--network"
}

variable "vpc__network_description" {
  type    = string
  default = "Network"
}

variable "vpc__subnet_public_a_name" {
  type    = string
  default = "vpc--subnet-public-a"
}

variable "vpc__subnet_public_a_description" {
  type    = string
  default = "Public subnet A"
}

variable "vpc__subnet_public_a_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "vpc__subnet_public_a_cidr" {
  type    = tuple([string])
  default = ["10.0.1.0/24"]
}

variable "vpc__subnet_public_b_name" {
  type    = string
  default = "vpc--subnet-public-b"
}

variable "vpc__subnet_public_b_description" {
  type    = string
  default = "Public subnet B"
}

variable "vpc__subnet_public_b_zone" {
  type    = string
  default = "ru-central1-b"
}

variable "vpc__subnet_public_b_cidr" {
  type    = tuple([string])
  default = ["10.0.2.0/24"]
}

variable "vpc__subnet_private_a_name" {
  type    = string
  default = "vpc--subnet-private-a"
}

variable "vpc__subnet_private_a_description" {
  type    = string
  default = "Private subnet A"
}

variable "vpc__subnet_private_a_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "vpc__subnet_private_a_cidr" {
  type    = tuple([string])
  default = ["10.1.1.0/24"]
}

variable "vpc__subnet_private_b_name" {
  type    = string
  default = "vpc--subnet-private-b"
}

variable "vpc__subnet_private_b_description" {
  type    = string
  default = "Private subnet B"
}

variable "vpc__subnet_private_b_zone" {
  type    = string
  default = "ru-central1-b"
}

variable "vpc__subnet_private_b_cidr" {
  type    = tuple([string])
  default = ["10.1.2.0/24"]
}

variable "vpc__route_table_name" {
  type    = string
  default = "vpc--route-table"
}

variable "vpc__route_table_description" {
  type    = string
  default = "Route table"
}

variable "vpc__gateway_name" {
  type    = string
  default = "vpc--gateway"
}

variable "vpc__gateway_description" {
  type    = string
  default = "Gateway"
}

variable "sg__bastion_name" {
  type    = string
  default = "sg--bastion"
}

variable "sg__bastion_description" {
  type    = string
  default = "Security group for Bastion"
}
