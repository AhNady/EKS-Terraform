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

variable "cluster_name" {
  type = string
  default = "my-cluster"
}

variable "cluster_version" {
  type = string
  default = "1.21"
}

variable "vpc_id" {
  type    = string
  default = ""
}

variable "subnet_ids" {
  type    = list(string)
  default = ["",""]
}

variable "private_subnet_ids" {
  type    = list(string)
  default = ["",""]
}

variable "instance_types" {
  type    = list(string)
  default = ["",""]
}