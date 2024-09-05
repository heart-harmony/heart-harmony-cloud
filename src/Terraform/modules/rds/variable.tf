variable "vpc_id" {
  description = "The id of the vpc"
  type        = string
}

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

variable "rds_subnet_group_name" {
  description = "The name of the rds subnet group"
  type        = string
}

variable "anywhere_ip" {
  description = "IP address for anywhere"
  type        = string
}