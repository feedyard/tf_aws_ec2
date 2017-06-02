// Module specific variables
variable "name" {}

variable "ami_id" {
  description = "The AMI to use"
  default = ""
}

variable "instance_type" {
  description = "The ec2 instance type to provision"
  default = ""
}

variable "key_pair" {
  description = "The key pair name to use in provisioning the instance"
  default = ""
}

variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  default = "false"
}

variable "vpc_security_group_ids" {
  description = "A list of VPC security group IDs"
  default     = []
}

variable "subnet_id" {
  description = "The VPC subnet the instance(s) will go in"
  default = ""
}

variable "associate_public_ip_address" {
  description = "If true, associate a public ip address with the instance(s)"
  default = "false"
}

variable "az" {
  description = "The AZ to start the instance in"
  default = ""
}

variable "instance_profile" {
  description = "The IAM Instance Profile to launch the instance(s) with"
  default = ""
}

variable "number_of_instances" {
  description = "number of instances to provision"
  default = 1
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}
