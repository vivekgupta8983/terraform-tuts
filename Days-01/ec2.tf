# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical
# }

resource "aws_instance" "web" {
  count = 3
  ami           = "ami-0b0ea68c435eb488d"
  instance_type = var.aws_instance_type

  tags = {
    Name = var.name
  }
}

output "instance_ip_addr" {
 value = aws_instance.web[*].private_ip
}

output "instance_public_ip" {
 value = aws_instance.web[*].public_ip
}