variable "vpc_id" {
    description = "vpc id"
    type        = string
}

variable "route_table_id" {
    description = "vpc route table Ids"
    type        = string
    default     = ""
}

variable "private_subnet_ids" {
    description = "vpc private subnet Ids|"
    type        = list(string)
    default     = []
}

variable "tags" {
    description = "A map of tags to add to all resources"
    type        = map(string)
    default     = {}
}

variable "vpc_endpoint_tags" {
    description = "Additional tags for the VPC Endpoints"
    type        = map(string)
    default     ={}
}

variable "enable_config_endpoint" {
    description    = "Should be true if you want to provision an config endpoint to the VPC"
    default        = false
}

variable "config_endpoint_security_group_ids" {
    description    = "The ID of one or more security groups to associate with the network interface for config endpoint"
    default        = []
}

variable "config_endpoint_subnet_ids" {
    description    = "The ID of one or more subnets in which to create a network interface for config endpoint. Only a single subnet within AZ is supported. if omitted, private subnets will be used."
    default        = []
}

variable "config_endpoint_private_dns_enabled" {
    description    = "Whether or not to associate a private hosted zone with the specific VPC for config endpoint"
    default        = false
}

variable "enable_ec2_endpoint" {
    description = "Should be true if you want to provision an EC2 endpoint to the VPC"
    type        = bool
    default     = false
}

variable "ec2_endpoint_security_group_ids" {
    description = "The ID of one or more security groups to associate with the network interface for EC2 endpoint"
    type        = list(string)
    default     = []
}

variable "ec2_endpoint_private_dns_enabled" {
    description = "Whether or not to associate a private hosted zone with the specific VPC for EC2 endpoint"
    type        = bool
    default     = false
}

variable "ec2_endpoint_subnet_ids" {
    description = "The ID of one or more subnets in which to create a network interface for EC2 endpoint. Only a single subnet within AZ is supported. If omitted, private subnets will be used."
    type        = list(string)
    default     = []
}