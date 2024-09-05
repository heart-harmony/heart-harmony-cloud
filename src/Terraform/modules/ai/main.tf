// AI용으로 할당한 EIP를 인스턴스에 연결
resource "aws_eip_association" "ai" {
  instance_id = aws_instance.ai.id
  allocation_id = data.aws_eip.ai.id
}

// AI 보안 그룹
resource "aws_security_group" "ai" {
  vpc_id = var.vpc_id
  
  ingress {
    description = "ssh"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.anywhere_ip]
  }
  
  ingress {
    description = "HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [var.anywhere_ip]
  }
  
  ingress {
    description = "HTTPS"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [var.anywhere_ip]
  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [var.anywhere_ip]
  }
  
  tags = {
    Name = "Project Heart Harmony ai security group"
  }
}

// AI 인스턴스
resource "aws_instance" "ai" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.ssh_keys["ai"]
  subnet_id     = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.ai.id]
  private_ip = var.private_ips["ai"]

  tags = {
    Name = "Project Heart Harmony ai"
  }
}