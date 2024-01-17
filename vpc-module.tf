module "vpc_dev" {
    source = "./Day-04"
    access_key = "AKIAWAY3OUANH6DHP57Z"
    secret_key = "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"
    vpc_name = "vpc-module-demo"
    vpc_cidr = "172.16.0.0/16"
    private_subnet = [ "172.16.1.0/24" , "172.16.2.0/24", "172.16.3.0/24"]
    public_subnet = [ "172.16.4.0/24" , "172.16.5.0/24", "172.16.6.0/24"]

}