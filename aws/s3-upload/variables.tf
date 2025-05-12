variable "dest_bucket" {
    description = "The name of the bucket to put the file in"
    type        = "string"
}

variable "key" {
    description = "The name of the object once its in the bucket"
    type        = "string"
}

variable "source_path" {
    description = "The path to a file that will be read and uploaded as raw bytes for the object content"
    type        = "string"
    default     = null
}

variable "upload_artifact" {
    description = "Upload file to S3"
    type        = bool
    default     = false
}

variable "download_artifact_filename" {
    description = "Download artifacts file name"
    type        = "string"
    default     = ""
}

variable "download_artifact_command" {
    description = "Command to download the artifact from nexus"
    type        = "string"
    default     = ""
}