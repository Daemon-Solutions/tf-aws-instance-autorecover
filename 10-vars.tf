
variable "envtype"              {}
variable "envname"              {}

variable "security_groups"      {}
variable "subnet_id"            {}
variable "instance_number"      {}
variable "instance_type"        {}
variable "ami_id"               {}
variable "user_data"            {}
variable "service_name"         {}
variable "availability_zone"    {}

variable "aws_region" {
  default = "eu-west-1"
}
