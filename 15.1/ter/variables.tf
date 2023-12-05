###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "nat-instance-image-id" {
  default = "fd80mrhj8fl2oe87o4e1"
}

variable "nat-instance-ip" {
  default = "192.168.10.254"
}

variable "ubuntu-2004-lts" {
  default = "fd8nn6vae2u4vo18bv3s"
}

variable "domain" {
  default = "netology"
}

variable "nat-instance-name" {
  default = "nat-instance-vm1"
}

variable "public-vm-name" {
  default = "public-vm1"
}

variable "private-vm-name" {
  default = "private-vm1"
}