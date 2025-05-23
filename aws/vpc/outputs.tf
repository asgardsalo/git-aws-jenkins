# VPC Endpoints

output "vpc_endpoint_ec2_id" {
    description = "The DNS entries for VPC Endpoint for EC2."
    value       = concat(aws_vpc_endpoint.ec2.*.id, [""])[0]
}

output "vpc_endpoint_ec2_network_interface_ids" {
    description = "One or more network interfaces for the VPC Endpoint for EC2"
    value       = flatten(aws_vpc_endpoint.ec2.*.network_interface_ids)
}

output "vpc_endpoint_ec2_dns_entry" {
    description = "The DNS entries for VPC Endpoint for EC2."
    value       = flatten(aws_vpc_endpoint.ec2.*.dns_entry)
}

output "vpc_endpoint_kms_id" {
    description = "The ID of VPC Endpoint for KMS."
    value       = concat(aws_vpc_endpoint.kms.*.id, [""])[0]
}

output "vpc_endpoint_kms_network_interface_ids" {
    description = "One or more network interfaces for the VPC Endpoint for KMS"
    value       = flatten(aws_vpc_endpoint.kms.*.network_interface_ids)
}

output "vpc_endpoint_kms_dns_entry" {
    description = "The DNS entries for VPC Endpoint for KMS."
    value       = flatten(aws_vpc_endpoint.kms.*.dns_entry)
}