locals {
    vpc_id = var.vpc_id

    vpce_tags = merge (
        var.tags,
        var.vpc_endpoint_tags
    )
}