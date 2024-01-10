variable "aws_instance_type" {
    default = "t3.micro"
  
}

variable "access_key" {
  default = ""
}

variable "secret_key" {
  default = ""
  type = string
}

variable "region" {
  default = "us-east-1"
  type = string
}

variable "name" {
  default = "web"
  type = string
}