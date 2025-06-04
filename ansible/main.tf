resource "aws_instance" "controller" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my-key.key_name
  tags = {
    Name = "Controller"
  }
}

resource "aws_instance" "node" {
  count         = var.node
  ami           = var.ami
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my-key.key_name
  tags = {
    Name = "node-${count.index + 1}"
  }
}

resource "aws_key_pair" "my-key" {
  key_name   = "ec2-key"
  public_key = file("C:/Users/maila/.ssh/id_rsa.pub")
}

resource "aws_security_group" "allow-ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_network_interface_sg_attachment" "controller-ssh" {
  network_interface_id = aws_instance.controller.primary_network_interface_id
  security_group_id    = aws_security_group.allow-ssh.id
}

resource "aws_network_interface_sg_attachment" "node-ssh" {
  count                = 2
  network_interface_id = aws_instance.node[count.index].primary_network_interface_id
  security_group_id    = aws_security_group.allow-ssh.id
}