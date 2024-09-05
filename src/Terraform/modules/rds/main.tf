// RDS 보안 그룹
resource "aws_security_group" "rds" {
  vpc_id = var.vpc_id

  ingress {
    description = "MySQL"
    from_port = 3306
    to_port = 3306
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
    Name = "Project Heart Harmony rds security group"
  }
}

// RDS 인스턴스
resource "aws_db_instance" "rds" {
    identifier            = var.identifier
    engine                = var.engine
    engine_version        = var.engine_version
    instance_class        = var.instance_class
    allocated_storage     = var.allocated_storage
    storage_type          = var.storage_type

    db_name               = var.rds_name
    username              = var.rds_username
    password              = var.rds_password
    
    publicly_accessible   = true
    skip_final_snapshot   = true

    vpc_security_group_ids = [aws_security_group.rds.id]
    db_subnet_group_name     = var.rds_subnet_group_name
    
    tags = {
        Name = "Project Heart Harmony RDS"
    }
}