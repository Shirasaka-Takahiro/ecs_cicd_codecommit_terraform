output "vpc_id" {
  value = module.prod.vpc_id
}

output "public_subnet_ids" {
  value = module.prod.public_subnet_ids
}

output "dmz_subnet_ids" {
  value = module.prod.dmz_subnet_ids
}

output "private_subnet_ids" {
  value = module.prod.private_subnet_ids
}

output "public_ip_natgateway" {
  value = module.prod.natgateway_ip
}

output "alb_dns_name" {
  value = module.prod.alb_dns_name
}