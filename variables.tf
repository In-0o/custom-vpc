variable "region" {
  default = "eu-west-1"
  type = string
}

variable "profile" {
  default = "TP1"
  type = string
}

variable "vpc_name" {
  description = "NOM DE MON VPC"
  type        = string
  default     = "Demo"
}

variable "vpc_cidr" {
  description = "plageIP"
  type        = string
  default     = "10.0.0.0/16"
}

variable "count" {
  description = "Demande de 2 zone avaibility"
  type        = number
  default     = 2
}