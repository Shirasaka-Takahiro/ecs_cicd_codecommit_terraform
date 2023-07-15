output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_ids" {
  value = values(aws_subnet.public_subnets)[*].id
}

output "dmz_subnet_ids" {
  value = values(aws_subnet.dmz_subnets)[*].id
}

output "private_subnet_ids" {
  value = values(aws_subnet.private_subnets)[*].id
}

output "natgateway_ip" {
  value = aws_eip.eip_nat_gateway.public_ip
}

output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}