
# resource "aws_instance" "server" {
#     provider = aws.tushar
#   count = 4

#   ami           = "ami-a1b2c3d4"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "Server-${count.index}"
#   }
# }

# output "instance_id" {
#   # Select all instance id using * in place of index value
#   value = aws_instance.server[*].id
# }

