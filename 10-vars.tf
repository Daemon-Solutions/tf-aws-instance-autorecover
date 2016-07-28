
variable "envtype"         {}
variable "envname"         {}

variable "instance_number" {}
variable "instance_type"   {}
variable "ami_id"          {}
variable "user_data"       {}
variable "service_name"    {}

variable "aws_region" {
  default = "eu-west-1"
}
