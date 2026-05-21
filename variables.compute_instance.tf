variable "ci__debian_family" {
  type    = string
  default = "debian-12"
}

variable "ci__bastion_platform_id" {
  type    = string
  default = "standard-v3"
}

variable "ci__bastion_name" {
  type    = string
  default = "ci--bastion"
}

variable "ci__bastion_hostname" {
  type    = string
  default = "bastion"
}

variable "ci__bastion_description" {
  type    = string
  default = "Bastion host"
}

variable "ci__bastion_role" {
  type    = string
  default = "bastion"
}
