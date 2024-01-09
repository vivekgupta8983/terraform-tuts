data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

output "instance_ip_addr" {
 value = aws_instance.web.private_ip 
}

output "ami_id" {
    value = data.aws_ami.ubuntu.id
}

output "instance_public_ip" {
  value = aws_instance.web.public_ip
}