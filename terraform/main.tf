resource "aws_security_group" "my-ec2" {
  name        = "Security Group"
  description = "Open 22,443,80,9000,3000"

  ingress = [
    for port in [22, 80, 443, 9000, 3000] : {
      description      = "TLS from VPC"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my-ec2"
  }
}

resource "aws_instance" "web" {
  ami                    = "ami-005fc0f236362e99f"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my-ec2.id]
  user_data              = templatefile("install.sh", {})

  tags = {
    Name = "my-web-server"
  }
  root_block_device {
    volume_size = 30
  }
}