<<<<<<< HEAD
provider "aws" {
  region = var.region
}

# Remote backend configured to use branch-specific key via -backend-config in pipeline
terraform {
  required_version = ">= 1.0"
}

# Create an S3 bucket named using zone, region, resource, name
resource "aws_s3_bucket" "bucket" {
  bucket = "${var.zone}-${var.region}-${var.resource}-${var.name}"
  acl    = "private"

  tags = {
    Name     = "${var.resource}-${var.name}"
    ManagedBy = "jenkins-terraform-pipeline"
  }
}

# Create a "folder" inside the bucket by creating an object with trailing slash
resource "aws_s3_bucket_object" "folder" {
  bucket = aws_s3_bucket.bucket.id
  key    = "${var.name}/" # creates a zero-byte object that acts like a folder
  content = ""
}
=======
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
>>>>>>> main
