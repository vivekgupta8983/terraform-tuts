resource "aws_instance" "web" {
  count = var.no_of_instance
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = data.template_file.init.rendered
  root_block_device {
    volume_size = "10"
    volume_type = "gp3"
    encrypted = true
    delete_on_termination = true
  }

  tags = {
    Name = "${var.instance_name}-{count.index}"
  }
}


resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6nmUiXf4lnKJKTcN96RIJe60Mfy/iQ4GTW8xB0m1KduO4J4nPYMs43JSKnbBDwv3Jg/aQqvJSaJAxnJbKqcV5zW5DF2+Z6al+MCi8BtfCE3mb0VStXP7DdvwuithE/vK5tYmn5UKKCNDj7P6QMkfvKAOqn24lh5N1hN9vfPrihEDuo7zcXu5uUkrNaqt63rV8Al8Yh26h6t0s8rTILxNzduNAeXLBwcb3NsMb/Kia1CZ5Nnv+OJ/TfbE1FkQoUjUqA19fuVG3k4JrlrBoCuoatAaqh1I+uiJK22nuwWvMsyCBvqBym6jdNJALoGX+jPCpvR3c9mXIHSagKD2c9JkT+xpqriU6dvexygaZUUZICtynez4xcvl1vtNYOOZNbxjO+Sk0bdXQtFJDOSfon1168bmSZgByc9L9/2tXL4LqTkL2d/GLYUv8CDgwESI7/3vY2tilth/PW5kIAnD/+FEPWIX1kHK5xCUU4bCt1CCOi9jgvJltTnIwz/tC6k2GfTs= vivek@Vivek"
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

dynamic "ingress"{  # it produces ingress nested blocks
    for_each = var.ingress_ports # iterating over the list variable
    iterator = iport
    content {
        from_port = iport.value
        to_port = iport.value
        protocol = "tcp"
        cidr_blocks = var.cidr_blocks
     }
   }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.instance_name}"
  }
}

