# # data "aws_ami" "ubuntu" {
# #   most_recent = true

# #   filter {
# #     name   = "name"
# #     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
# #   }

# #   filter {
# #     name   = "virtualization-type"
# #     values = ["hvm"]
# #   }

# #   owners = ["099720109477"] # Canonical
# # }

# resource "aws_instance" "web" {
#   for_each = toset(var.users)
#   ami           = "ami-0b0ea68c435eb488d"
#   instance_type = var.aws_instance_type

#   tags = {
#     Name = each.key
#   }
# }

# output "instance_ip_addr" {
#  value = aws_instance.web["demo-user"].private_ip
# }

# # output "instance_public_ip" {
# #  value = aws_instance.web[each.key].public_ip
# # }