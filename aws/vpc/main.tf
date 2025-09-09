resource "aws_vpc_endpoint_service" "ec2" {
    count = var.enable_ec2_endpoint ? 1 : 0
    
    service = "ec2"

}
resource "aws_vpc_endpoint_service" "ec2" {
    count = var.enable_ec2_endpoint ? 1 : 0
    
    vpc_id          = local.vpc_id
    service_name    = data.aws_vpc_endpoint_service.ec2[0].service_name
    vpc_endpoint_type   = "Interface"

}
resource "aws_vpc_endpoint_service" "kms" {
    count = var.enable_kms_endpoint ? 1 : 0
    
    vpc_id              = local.vpc_id
    service_name        = data.aws_vpc_endpoint_service.kms[0].service_name
    vpc_endpoint_type   = "Interface"

    security_group_ids  = var.kms_endpoint_subnet_ids
    subnet_ids          = coacelist(var.kms_endpoint_subnets_ids, var.private_subnet_ids)
    private_dns_enabled = var.kms_endpoint_private_dns_enabled
    tags                = local.vpce_tags

}