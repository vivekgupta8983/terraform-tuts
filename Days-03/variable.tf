variable "aws_instance_type" {
  default = "t3.micro"

}

variable "access_key" {
  default = "AKIAWAY3OUANBIQTZXP6"
}

variable "secret_key" {
  default = "O5CChM7W8V/o1y/HFtyJkjNdyzKi/hASqmoE7Svr"
  type    = string
}

variable "region" {
  default = "us-east-1"
  type    = string
}

variable "name" {
  default = "web"
  type    = string
}