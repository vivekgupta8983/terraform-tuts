variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t3.micro"
}


variable "instance_name" {
  default = "devcloudgeek"
}

variable "no_of_instance" {
  default = "1"
  type = number
}

variable "subnet_id" {
  default = ""
  type = string
}

variable "vpc_id" {
  default = ""
}

variable "ingress_ports" {
  default = [ "22" ]
  type = list(string)
}

variable "cidr_blocks" {
  default = [ "0.0.0.0/0" ]
  type = list(string)
  
}