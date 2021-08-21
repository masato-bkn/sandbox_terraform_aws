module "network" {
  source = "./network"

  vpc_cidr           = "10.0.0.0/16"
  availability_zones = ["a", "c"]
}

module "cognito" {
  source = "./cognito"
}
