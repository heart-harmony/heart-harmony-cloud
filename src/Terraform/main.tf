module "ami" {
    source = "./modules/ami"
}

module "network" {
    source = "./modules/network"

    vpc_cidr         = var.vpc_cidr
    subnet_cidr      = var.public_subnet_cidr
    rds_subnet_cidrs = var.rds_subnet_cidrs
    anywhere_ip      = var.anywhere_ip
}

module "back" {
    source = "./modules/backend"

    vpc_id           = module.network.vpc_id
    public_subnet_id = module.network.public_subnet_id
    elastic_ip_names = var.elastic_ip_names
    private_ips      = var.private_ips
    anywhere_ip      = var.anywhere_ip

    ami_id           = module.ami.amazon_linux_id
    instance_type    = var.instance_type
    ssh_keys         = var.ssh_keys
}

module "ai" {
    source = "./modules/ai"

    vpc_id           = module.network.vpc_id
    public_subnet_id = module.network.public_subnet_id
    elastic_ip_names = var.elastic_ip_names
    private_ips      = var.private_ips
    anywhere_ip      = var.anywhere_ip

    ami_id           = module.ami.amazon_linux_id
    instance_type    = var.instance_type
    ssh_keys         = var.ssh_keys
}

module "rds" {
    source = "./modules/rds"

    vpc_id            = module.network.vpc_id
    anywhere_ip       = var.anywhere_ip

    identifier        = var.identifier
    engine            = var.engine
    engine_version    = var.engine_version
    instance_class    = var.instance_class
    allocated_storage = var.allocated_storage
    storage_type      = var.storage_type

    rds_name          = var.rds_name
    rds_username      = var.rds_username
    rds_password      = var.rds_password

    rds_subnet_group_name = module.network.rds_subnet_group_name
}

module "s3" {
    source = "./modules/s3"

    deployment_bucket_name = var.deployment_bucket_name
}