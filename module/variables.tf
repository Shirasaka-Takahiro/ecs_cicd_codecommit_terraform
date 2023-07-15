variable "general_config" {
  type = map(any)
}
variable "regions" {
  type = map(any)
}
variable "account_id" {}
variable "vpc_cidr" {}
variable "availability_zones" {}
variable "public_subnets" {}
variable "dmz_subnets" {}
variable "private_subnets" {}
variable "public_subnet_ids" {}
variable "dmz_subnet_ids" {}
variable "private_subnet_ids" {}
#variable "zone_name" {}
variable "sub_domain_1" {}
variable "repository_name" {}
variable "image_name" {}
#variable "docker_dir" {}
variable "fargate_cpu" {}
variable "fargate_memory" {}
provider "aws" {
  alias  = "us-east-1"
  region = var.regions["virginia"]
}
variable "github_url" {}