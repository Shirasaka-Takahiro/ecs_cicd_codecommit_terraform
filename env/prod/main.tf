provider "aws" {
  profile = "terraform-user"
  region  = var.regions["tokyo"]
}

provider "aws" {
  profile = "terraform-user"
  alias   = "us-east-1"
  region  = var.regions["virginia"]
}

module "prod" {
  source = "../../module"

  general_config     = var.general_config
  regions            = var.regions
  account_id         = var.account_id
  availability_zones = var.availability_zones
  vpc_cidr           = var.vpc_cidr
  public_subnets     = var.public_subnets
  dmz_subnets        = var.dmz_subnets
  private_subnets    = var.private_subnets
  public_subnet_ids  = module.prod.public_subnet_ids
  dmz_subnet_ids     = module.prod.dmz_subnet_ids
  private_subnet_ids = module.prod.private_subnet_ids
  #zone_name          = var.zone_name
  sub_domain_1    = var.sub_domain_1
  repository_name = var.repository_name
  image_name      = var.image_name
  fargate_cpu     = var.fargate_cpu
  fargate_memory  = var.fargate_memory
  github_url = var.github_url
}