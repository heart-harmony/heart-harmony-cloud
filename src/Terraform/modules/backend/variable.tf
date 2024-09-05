variable "vpc_id" {
    description = "The id of vpc"
    type        = string
}

variable "elastic_ip_names" {
    description = "The names of allocated elastic ips"
    type        = map(string) 
}

variable private_ips {
    description = "The private ips of each instances"
    type        = map(string)
}

variable "anywhere_ip" {
    description = "The ip address of anywhere"
    type        = string
}

variable "ami_id" {
    description = "The ami id of instance"
    type        = string
}

variable "instance_type" {
    description = "The instance type of instance"
    type        = string
}

variable "ssh_keys" {
    description = "The ssh key of instance"
    type        = map(string)
}

variable "public_subnet_id" {
    description = "The subnet id of public subnet"
    type        = string
}