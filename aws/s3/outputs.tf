output "bucket_name" {
  value = aws_s3_bucket.bucket.bucket
}

output "folder_key" {
  value = aws_s3_bucket_object.folder.key
}

