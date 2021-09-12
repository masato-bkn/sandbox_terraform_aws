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
  web_server_id     = module.ec2.web_server_id
}

module "ec2" {
  source    = "./ec2"
  subnet_id = module.network.subnet_public_ids[0]
  vpc_id    = module.network.vpc_id
}

module "ecs" {
  source               = "./ecs"
  vpc_id               = module.network.vpc_id
  elb_ecurity_group_id = module.elb.elb_ecurity_group_id
}

module "ecr" {
  source = "./ecr"
}

module "iam" {
  source = "./iam"
}
