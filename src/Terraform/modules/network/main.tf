// VPC 생성
resource "aws_vpc" "heart_harmony" {
    cidr_block           = var.vpc_cidr
    enable_dns_hostnames = true

    tags = {
        Name        = "Heart Haromy VPC"
        Description = "Project Heart Harmony network vpc"
    }
}

// Public subnet 생성
resource "aws_subnet" "public" {
    vpc_id            = aws_vpc.heart_harmony.id
    cidr_block        = var.subnet_cidr
    availability_zone = data.aws_availability_zones.selected.names[1]

    tags = {
        Name        = "Heart Harmony subnet"
        Description = "Project Heart Harmony public subnet"
    }
}

// RDS subnet 생성
resource "aws_subnet" "rds" {
    count             = length(var.rds_subnet_cidrs)
    vpc_id            = aws_vpc.heart_harmony.id
    cidr_block        = var.rds_subnet_cidrs[count.index]
    availability_zone = data.aws_availability_zones.selected.names[count.index]

    tags = {
        Name = "HH RDS ${data.aws_availability_zones.selected.names[count.index]} subnet"
        Description = "Project Heart Harmony RDS subnets"
    }
}

// RDS subnet 그룹 생성
resource "aws_db_subnet_group" "rds" {
    subnet_ids = aws_subnet.rds[*].id

    tags = {
        Name = "Project Heart Harmony RDS subnet group"
    }
}

// Internet gateway 생성
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.heart_harmony.id

    tags = {
        Name = "Project Heart Harmony internet gateway"
    }
}

// Public route table 생성 및 internet gateway에 연결
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.heart_harmony.id

    route {
        cidr_block = var.anywhere_ip
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
      Name = "Project Heart Harmony route table"
    }
}

// Public route table을 public subnet에 연결
resource "aws_route_table_association" "public" {
    subnet_id      = aws_subnet.public.id
    route_table_id = aws_route_table.public.id
}