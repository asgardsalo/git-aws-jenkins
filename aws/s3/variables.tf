variable "zone" {
  description = "Zone short name (e.g., us)"
  type        = string
}

variable "region" {
  description = "AWS region (e.g., east-1)"
  type        = string
}

variable "resource" {
  description = "Resource type (e.g., S3)"
  type        = string
}

variable "name" {
  description = "Resource name (e.g., test-folder)"
  type        = string
}

variable "state_bucket" {
  description = "S3 bucket for Terraform remote state"
  type        = string
  default     = "my-terraform-state-bucket"
}

variable "state_key_prefix" {
  description = "Prefix for branch-specific state key"
  type        = string
  default     = "branches"
}

