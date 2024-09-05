variable "vpc_cidr" {
    description = "The cidr block of vpc"
    type        = string
}

variable "subnet_cidr" {
    description = "The cidr block of public subnet"
    type        = string
}

variable "rds_subnet_cidrs" {
    description = "The cidr blocks of rds subnet"
    type        = list(string)
}

variable "anywhere_ip" {
    description = "The ip of any ip input"
    type        = string
}