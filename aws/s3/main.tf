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
