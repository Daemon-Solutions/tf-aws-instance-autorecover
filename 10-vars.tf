/* Environment variables */
variable "envname" {
  description = "Value to form part of the interpolated value for the 'Name' tag at position 1"
  type = "string"
  default = "dev"
}

variable "envtype" {
  description = "The value for the 'Environment' tag as well as part of the interpolated value for the 'Name' tag at position 2"
  type = "string"
  default = "nonprod"
}

variable "service_name" {
  description = "Value to form part of the interpolated value for the 'Name' tag at position 3"
  type = "string"
  default = "autorecovery"
}

variable "instance_number" {
  description = "Value to form part of the interpolated value for the 'Name' tag at position 4"
  type = "string"
  default = 0
}

/* AWS region and AZ */
variable "aws_region" {
  description = "The AWS region in which to create the auto recoverable instance"
  type = "string"
  default = "eu-west-1"
}

variable "availability_zone" {
  description = "The availability zone in which to create the auto recoverable instance"
  type = "string"
  default = "eu-west-1b"
}

/* Instance variables */
variable "subnet_id" {
  description = "The subnet ID where this instance is to be placed"
  type = "string"
}

variable "ami_id" {
  description = "The AMI to build this instance from"
  type = "string"
}

variable "security_groups" {
  description = "List of security groups to associate with this instance"
  type = "list"
  default = []
}

variable "instance_type" {
  description = "The EC2 instance type to use"
  type = "string"
  default = "t2.micro"
}

variable "user_data" {
  description = "The user_data to launch the instance with"
  type = "string"
  default = ""
}

variable "iam_instance_profile" {
  description = "The IAM instance profile to associate with launched instances"
  type = "string"
  default = ""
}
