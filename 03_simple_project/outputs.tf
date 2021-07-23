output "network_name" {
  value       = module.test-vpc-module.network_name
  description = "The nam eof the VPC being created"
}

output "network_self_link" {
  value       = module.test-vpc-module.network_self_link
  description = "The URI of the VPC being created"
}

output "project_id" {
  value       = module.test-vpc-module.project_id
  description = "VPC project id"
}

output "subnet_names" {
  value       = module.test-vpc-module.subnet_names
  description = "The names of the subnet being created"
}

output "subnet_ips" {
  value       = module.test-vpc-module.subnet_ips
  description = "The IP and cidrs of the subnets being created"
}

output "subnet_regions" {
  value       = module.test-vpc-module.subnet_regions
  description = "The regions where the subnets will be created"
}

output "subnets_private_access" {
  value       = module.test-vpc-module.subnets_private_access
  description = "Whether the subnets will have access to Google Api's without a public IP"
}

output "subnets_flow_logs" {
  value       = module.test-vpc-module.subnets_flow_logs
  description = "Whether the subnets will have VPC flow logs enabled"
}

output "subnets_secondary_ranges" {
  value       = module.test-vpc-module.subnets_secondary_ranges
  description = "The secondary ranges associated with these subnets"
}

output "route_names" {
  value       = module.test-vpc-module.route_names
  description = "The routs associated with this VPC"
}
