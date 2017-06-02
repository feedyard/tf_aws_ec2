ec2 terraform module
===========

A terraform module to create an ec2 instance AWS.


Module Input Variables
----------------------

- `name` - A unique name used as Name tag on ec2 instance
- `ami_id` - The AMI to use
- `instance_type` - The ec2 instance type to provision
- `number_of_instances` - The number of instances to provision
- `key_pair` - (Optional) The ec2 instance type to provision
- `subnet_id` - (Optional) The VPC subnet the instance(s) will go in
- `az` - (Optional) The AZ to start the instance(s) in
- `associate_public_ip_address` - If true, associate a public ip address with the instance(s)
- `vpc_security_group_ids` - (Optional) A list of VPC security group IDs
- `instance_profile` - The IAM Instance Profile to launch the instance(s) with
- `monitoring` - (Optional) If true, the launched EC2 instance will have detailed monitoring enabled
- `tags` - (Optional) dictionary of tags that will be added to resources created by the module

Usage
-----

```hcl
module "ec2" {
  source = "github.com/feedyard/tf_aws_ec2"

  name = "my-ec2"
  ami_id = "ami-20631a36"
  number_of_instances = 1

  key_pair = "my-key"
  subnet_id = "subnet-c77b17c2"
  az = "us-east-1b"
  associate_public_ip_address = "false"
  vpc_security_group_ids = ["sg-1aaaa065","sg-1a38ab22"]
  security_groups = ["sg-1aaaa065","sg-1a38ab22"]
  instance_profile = "my_profile"
  monitoring = "true"
  
  tags {
    "Terraform" = "true"
    "Environment" = "${var.environment}"
  }
}
```

Outputs
=======

 - `ec2_instance_id` - The ID that identifies the ec2 instance
