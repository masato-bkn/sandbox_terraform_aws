module "network" {
  source = "./network"

  vpc_cidr           = "10.0.0.0/16"
  availability_zones = ["a", "c"]
}

module "cognito" {
  source = "./cognito"
}

module "elb" {
  source = "./elb"

  vpc_id            = module.network.vpc_id
  subnet_public_ids = module.network.subnet_public_ids
}

module "ec2" {
  source = "./ec2"

  vpc_id = module.network.vpc_id
}