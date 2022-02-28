variable "access_key" {
  type    = string
  default = "AKIATQHD7NQVXT762EW4"
}

variable "secret_key" {
  type    = string
  default = "Z9/66iyimAtt1BHr8yWwnPuTXV8vVAg54Jq5fPZy"
}

variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "vpc_name" {
  type    = string
  default = "main"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a","us-east-1b"]
}

variable "public_subnets_cidr" {
  type    = list(string)
  default = ["10.0.64.0/19", "10.0.96.0/19"]
}

variable "private_subnets_cidr" {
  type    = list(string)
  default = ["10.0.0.0/19", "10.0.32.0/19"]
}

variable "igw_tags" {
  type        = map(string)
  default     = {"Name" = "igw"}
}

variable "public_subnet_tags" {
  type        = map(string)
  default     = {"Name" = "public-subnet"}
}


variable "private_subnet_tags" {
  type        = map(string)
  default     = {"Name" = "private-subnet"}
}

variable "nat_gateway_tags" {
  type        = map(string)
  default     = {"Name" = "nat_gateway"}
}

variable "public_route_table_tags" {
  type        = map(string)
  default     = {"Name" = "public"}
}

variable "private_route_table_tags" {
  type        = map(string)
  default     = {"Name" = "private"}
}
