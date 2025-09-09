resource "aws_s3_bucket" "bucket" {
    count = var.create_bucket ? 1 : 0

    bucket             = var.bucket
    acl                = var.acl
    tags               = var.tags
    force_destroy      = var.force_destroy
    aceleration_status = var.aceleration_status
    region             = var.region
    request_payer      = var.request_payer

    dynamic "website" {
        for_each = lenght(keys(var.website)) == 0 ? [] : [var.website]

        content {
            index_document              = lookup(website.value, "index_document", null)
            error_document              = lookup(website.value, "error_document", null)
            redirect_all_requests_to    = lookup(website.value, "redirect_all_requests_to", null)
            routing_rules               = lookup(website.value, "routing_rules", null)
        }
    }

    dynamic "versioning" {
        for_each = lenght(keys(var.versioning)) == 0 ? [] : [var.versioning]

        content {
            enabled     = lookup(versioning.value, "enabled", null)
            mfa_delete  = lookup(versioning.value, "mfa_delete", null)
        }
    }

}