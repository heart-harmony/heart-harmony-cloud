// 네트워크 변수
variable "vpc_cidr" {
    description = "The cidr block of vpc"
    type        = string
}

variable "public_subnet_cidr" {
    description = "The cidr block of public subnet"
    type        = string
}

variable "rds_subnet_cidrs" {
    description = "The cidr blocks of rds subnet"
    type        = list(string)
}

variable private_ips {
    description = "The private ips of each instances"
    type        = map(string)
}

variable "anywhere_ip" {
    description = "The ip of any ip input"
    type        = string
}

variable "elastic_ip_names" {
    description = "The names of allocated elastic ips"
    type        = map(string) 
}

// 인스턴스 변수
variable "instance_type" {
    description = "The instance type of instance"
    type        = string
}

variable "ssh_keys" {
    description = "The ssh key of instance"
    type        = map(string)
}

// RDS 변수
variable identifier {
  description = "The name of rds instance"
  type        = string
}

variable "engine" {
  description = "The engine of rds"
  type        = string
}

variable "engine_version" {
  description = "The engine version of rds"
  type        = string
}

variable "instance_class" {
  description = "The instance type of rds"
  type        = string
}

variable "allocated_storage" {
  description = "The allocated storage of rds"
  type        = number
}

variable "storage_type" {
  description = "Database storage type"
  type        = string
}

variable "rds_name" {
  description = "Name of rds"
  type        = string
}

variable "rds_username" {
  description = "The username of rds"
  type        = string
}

variable "rds_password" {
  description = "The password of rds"
  type        = string
}

// S3 변수
variable "deployment_bucket_name" {
    description = "The name of deployment bucket name"
    type        = string
}