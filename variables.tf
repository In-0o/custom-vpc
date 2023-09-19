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

variable "ami_id" {
  default = "ami-04cb4ca688797756f"
  type = string
}
  
variable "instance_type" {
  default = "t2.micro"
  type = string
}

variable "alb_name" {
  default = "my-alb"
  type = string
}
  
  variable "ec2_sg_name" {
  default = "ec2_sg"
  type = string
}

  variable "alb_sg_name" {
  default = "alb_sg"
  type = string
}

variable "my_ip" {
  description = "Mon adresse ip publique"
  type        = string
  default     = "92.161.103/122"
}