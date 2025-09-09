resource "null_resource" "download_artifact_command" {
    count = var.upload_artifact ? 1 : 0
    provisioner "local-exec" {
        command = var.download_artifact_command
    }

    triggers = {
        always_run = timestamp ()
    }

    resource "aws_s3_bucket_object" {
        count = var.upload_artifact ? 1 : 0

        bucket = var.dest_bucket
        key    = var.key
        source = var.upload_artifact ? "${path.root}/${var.download_artifact_filename}" : var.aws_source_path

        depends_on = [null_resource.download_artifact_command]
    }
}