data "aws_ami" "latest_amazon_linux2" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "name"
    values = ["amzn2-ami-kernel-5.10-*-x86_64-gp2"]
  }
}

resource "aws_instance" "instance" {
  count = 2
  ami = data.aws_ami.latest_amazon_linux2.id
  instance_type = var.type
  subnet_id = element(var.public_subnet_id,count.index)
  associate_public_ip_address = true
  availability_zone = element(var.az,count.index)
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name = "aws-key"
    tags = {
      Name = "${var.env}-instance-${count.index+1}"
  }
  user_data = <<-EOF
                    #!/bin/bash
                    sudo su -
                    yum update -y 
                    yum install httpd -y 
                    echo "This is from $(hostname) instance" >> /var/www/html/index.html
                    systemctl start httpd
                    systemctl enable httpd
                EOF
}

resource "aws_security_group" "sg" {
  name = "${var.env}-sg"
  description = "Allows http, https and ssh connections"
  vpc_id = var.vpc_id
  dynamic "ingress" {
    for_each = [80,443,22]
    iterator = port
    content {
      from_port = port.value
      to_port = port.value
      protocol = "tcp" 
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}

