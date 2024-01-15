variable "istest" {
    type = bool
    default = false
}

# Creating the test-server instance if `istest` equals true
resource "aws_instance" "test-server" {
  ami = "ami-05cafdf7c9f772ad2"
  instance_type = "t2.micro"
  count = var.istest == true ? 1:3  # conditional expression
}

# # Creating the prod-server instance if `istest` equals false
# resource "aws_instance" "prod-server" {
#   ami = "ami-05cafdf7c9f772ad2"
#   instance_type = "t2.large"   # it's not free tier eligible
#   count = var.istest == false ? 3:0  # conditional expression
# }