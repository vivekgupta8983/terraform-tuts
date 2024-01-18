module "vpc" {
    source = "./modules/vpc"
    vpc_name = "vpc-module-demo"
    vpc_cidr = "172.16.0.0/16"
    private_subnet = [ "172.16.1.0/24" , "172.16.2.0/24", "172.16.3.0/24"]
    public_subnet = [ "172.16.4.0/24" , "172.16.5.0/24", "172.16.6.0/24"]
}

module "ec2" {
    source = "./modules/ec2"
    vpc_id = module.vpc.vpc_id
    subnet_id = module.vpc.public_subnet_ids
}